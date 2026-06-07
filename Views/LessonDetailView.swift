import SwiftUI
import AppKit

struct LessonDetailView: View {
    @Environment(AppState.self) private var appState
    let week: WeekUnit
    let lesson: LessonStep

    @State private var challengeAnswer = ""
    @State private var challengeFeedback: String?
    @State private var challengeCorrect = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headerRow

                Card(title: lesson.title, subtitle: "Week \(week.id)", accent: .purple) {
                    Text(lesson.body)
                }

                Card(title: "Teacher script", subtitle: "Words for parent/coach", accent: .orange) {
                    Text(lesson.teacherScript)
                        .italic()
                }

                if let prompt = lesson.tryItPrompt {
                    Card(title: "Try it", accent: .blue) {
                        Text(prompt)
                    }
                }

                if let code = lesson.starterCode {
                    Card(title: "Starter code", accent: .green) {
                        CodeBlockView(code: code) {
                            NSPasteboard.general.clearContents()
                            NSPasteboard.general.setString(code, forType: .string)
                        }
                        NavigationLink {
                            PlaygroundView(
                                initialCode: code,
                                title: lesson.title,
                                contextKey: PlaygroundContext.lesson(lesson.id),
                                scriptFilename: "\(lesson.id).py",
                                codeTests: lesson.codeTests ?? []
                            )
                        } label: {
                            Label("Open in Playground", systemImage: "terminal")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }

                if let question = lesson.challengeQuestion {
                    challengeCard(question: question)
                }

                completionButtons
            }
            .padding(24)
        }
        .coachPageBackground()
        .navigationTitle(lesson.title)
    }

    private var headerRow: some View {
        HStack {
            if appState.isStuck(lesson.id) {
                Label("Marked stuck — revisit with parent", systemImage: "hand.raised.fill")
                    .font(.caption)
                    .foregroundStyle(.orange)
            }
            Spacer()
            Button {
                appState.toggleStuck(lesson.id)
            } label: {
                Label(
                    appState.isStuck(lesson.id) ? "Unmark stuck" : "Mark stuck",
                    systemImage: appState.isStuck(lesson.id) ? "hand.raised.slash" : "hand.raised"
                )
            }
            .buttonStyle(.borderless)
        }
    }

    private func challengeCard(question: String) -> some View {
        Card(title: "Quick check", accent: .cyan) {
            Text(question)
            TextField("Your answer", text: $challengeAnswer)
                .textFieldStyle(.roundedBorder)
                .disabled(challengeCorrect)
            Button("Check") {
                let accepted = lesson.allAcceptedAnswers
                if ChallengeValidator.isCorrect(answer: challengeAnswer, accepted: accepted) {
                    challengeFeedback = "Correct!"
                    challengeCorrect = true
                } else {
                    challengeFeedback = "Not quite — try again."
                }
            }
            .disabled(challengeCorrect)
            if let challengeFeedback {
                Text(challengeFeedback)
                    .foregroundStyle(challengeCorrect ? .green : .orange)
            }
            if !challengeCorrect, let hint = lesson.challengeAnswer {
                Text("Hint: \(hint)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private var completionButtons: some View {
        Button {
            appState.toggleLesson(lesson.id)
        } label: {
            Label(
                appState.isLessonComplete(lesson.id) ? "Mark incomplete" : "Mark lesson complete",
                systemImage: appState.isLessonComplete(lesson.id) ? "arrow.uturn.backward.circle" : "checkmark.circle.fill"
            )
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(appState.isLessonComplete(lesson.id) ? .secondary : .green)
    }
}
