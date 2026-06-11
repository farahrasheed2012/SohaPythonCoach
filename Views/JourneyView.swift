import SwiftUI

struct JourneyView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                header
                outcomeRow
                weekGrid
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle("\(appState.weeks.count)-Week Journey")
    }

    private var weekCount: Int { appState.weeks.count }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Hi, \(appState.studentName)! 👋")
                    .font(.largeTitle.bold())
                Text("\(weekCount) calendar weeks · matches summer-2026-calendar · 50 app sessions · 5 games")
                    .foregroundStyle(.secondary)
                Text("Open the week that matches today’s calendar block (e.g. Week 1 → L1 (1–5)).")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            Spacer()
            ProgressRing(fraction: appState.progressFraction, label: "Lessons done")
        }
    }

    private var outcomeRow: some View {
        Card(title: "After \(weekCount) weeks you will…", accent: .blue) {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                ForEach(appState.outcomes) { goal in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(goal.title)
                            .font(.subheadline.weight(.semibold))
                        Text(goal.detail)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }

    private var weekGrid: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            ForEach(appState.weeks) { week in
                NavigationLink(value: week) {
                    WeekCard(week: week, progress: appState.weekProgress(week))
                }
                .buttonStyle(.plain)
            }
        }
    }
}

private struct WeekCard: View {
    let week: WeekUnit
    let progress: Double

    private var courseLabel: String? {
        if week.id >= 9 { return "Pass 3" }
        if week.id >= 5 { return "Pass 2" }
        return "Pass 1"
    }

    private var badgeColor: Color {
        if week.id >= 9 { return .green }
        if week.id >= 5 { return .blue }
        return .purple
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(week.emoji)
                    .font(.largeTitle)
                Spacer()
                Text("Week \(week.id)")
                    .font(.caption.weight(.bold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(badgeColor.opacity(0.15))
                    .clipShape(Capsule())
            }
            if let courseLabel {
                Text(courseLabel)
                    .font(.caption2.weight(.semibold))
                    .foregroundStyle(badgeColor)
            }
            Text(week.title)
                .font(.title3.bold())
            Text(week.subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(2)
            ProgressView(value: progress)
                .tint(.purple)
            Text("\(week.lessons.count) lessons")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .padding(16)
        .frame(maxWidth: .infinity, minHeight: 160, alignment: .leading)
        .background(Color(nsColor: .controlBackgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .strokeBorder(Color.purple.opacity(0.2), lineWidth: 1)
        )
    }
}

struct WeekDetailView: View {
    @Environment(AppState.self) private var appState
    let week: WeekUnit

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Card(title: "\(week.emoji) Week \(week.id): \(week.title)", subtitle: week.subtitle, accent: .purple) {
                    Text(week.goal)
                        .font(.body)
                    FlowLayout(spacing: 6) {
                        ForEach(week.skills, id: \.self) { SkillPill(text: $0) }
                    }
                }

                Card(title: "Parent notes", subtitle: "Private — for you only", accent: .orange) {
                    TextField("How did this week go? What to revisit?", text: Binding(
                        get: { appState.weekNote(for: week.id) },
                        set: { appState.setWeekNote($0, for: week.id) }
                    ), axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(3...6)
                }

                ForEach(week.lessons) { lesson in
                    NavigationLink {
                        LessonDetailView(week: week, lesson: lesson)
                    } label: {
                        HStack {
                            Image(systemName: appState.isLessonComplete(lesson.id) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(appState.isLessonComplete(lesson.id) ? .green : .secondary)
                            VStack(alignment: .leading) {
                                HStack(spacing: 6) {
                                    Text(lesson.title)
                                        .font(.headline)
                                    if let mins = lesson.durationMinutes {
                                        Text("~\(mins) min")
                                            .font(.caption2.weight(.bold))
                                            .padding(.horizontal, 6)
                                            .padding(.vertical, 2)
                                            .background(Color.purple.opacity(0.12))
                                            .clipShape(Capsule())
                                    }
                                    if appState.isStuck(lesson.id) {
                                        Image(systemName: "hand.raised.fill")
                                            .font(.caption)
                                            .foregroundStyle(.orange)
                                    }
                                }
                                Text(LessonTextFormatting.plainText(from: lesson.body))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.tertiary)
                        }
                        .padding(14)
                        .background(Color(nsColor: .controlBackgroundColor))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle("Week \(week.id)")
    }
}

/// Simple flow layout for skill pills
struct FlowLayout: Layout {
    var spacing: CGFloat = 8

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrange(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrange(proposal: proposal, subviews: subviews)
        for (index, frame) in result.frames.enumerated() {
            subviews[index].place(at: CGPoint(x: bounds.minX + frame.minX, y: bounds.minY + frame.minY), proposal: .unspecified)
        }
    }

    private func arrange(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, frames: [CGRect]) {
        let maxWidth = proposal.width ?? .infinity
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        var frames: [CGRect] = []

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if x + size.width > maxWidth, x > 0 {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            frames.append(CGRect(origin: CGPoint(x: x, y: y), size: size))
            rowHeight = max(rowHeight, size.height)
            x += size.width + spacing
        }
        return (CGSize(width: maxWidth, height: y + rowHeight), frames)
    }
}
