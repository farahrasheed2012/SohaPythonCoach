import SwiftUI
import AppKit

struct LessonDetailView: View {
    @Environment(AppState.self) private var appState
    let week: WeekUnit
    let lesson: LessonStep

    @State private var challengeAnswer = ""
    @State private var challengeFeedback: String?
    @State private var challengeCorrect = false
    @State private var wrongAttempts = 0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                headerRow

                Card(title: lesson.title, subtitle: lessonSubtitle, accent: .purple) {
                    HStack(alignment: .top, spacing: 12) {
                        LessonBodyText(text: lesson.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Button("Copy") {
                            ClipboardHelper.copy(LessonTextFormatting.plainText(from: lesson.body))
                        }
                        .controlSize(.small)
                    }
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
                            ClipboardHelper.copy(code)
                        }
                        playgroundLink(starterCode: code)
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
        .onAppear {
            if appState.isLessonComplete(lesson.id), lesson.challengeQuestion != nil {
                challengeCorrect = true
                challengeFeedback = "Correct!"
            }
        }
    }

    private var lessonSubtitle: String {
        let base = "Journey wk \(week.id) · \(week.title)"
        if let mins = lesson.durationMinutes {
            return "\(base) · ~\(mins) min"
        }
        return base
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
            HStack(alignment: .top, spacing: 12) {
                Text(question)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button("Copy") {
                    ClipboardHelper.copy(question)
                }
                .controlSize(.small)
            }
            TextField("Your answer", text: $challengeAnswer)
                .textFieldStyle(.roundedBorder)
                .disabled(challengeCorrect)
            Button("Check") {
                let accepted = lesson.allAcceptedAnswers
                if ChallengeValidator.looksLikeCodePaste(challengeAnswer) {
                    wrongAttempts += 1
                    challengeFeedback = "Type the answer in your own words — don't paste starter code."
                } else if ChallengeValidator.isCorrect(answer: challengeAnswer, accepted: accepted) {
                    challengeFeedback = "Correct!"
                    challengeCorrect = true
                } else {
                    wrongAttempts += 1
                    challengeFeedback = "Not quite — try again."
                }
            }
            .disabled(challengeCorrect)
            if lesson.starterCode == nil {
                playgroundLink(starterCode: nil)
            }
            if let challengeFeedback {
                Text(challengeFeedback)
                    .foregroundStyle(challengeCorrect ? .green : .orange)
            }
            if !challengeCorrect, wrongAttempts >= 2, let hint = lesson.challengeAnswer {
                Text("Hint: \(hint)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

    private func playgroundLink(starterCode: String?) -> some View {
        NavigationLink {
            PlaygroundView(
                initialCode: PlaygroundContext.lessonPlaygroundCode(
                    starter: starterCode,
                    lessonTitle: lesson.title,
                    lessonBody: lesson.body,
                    challengeQuestion: lesson.challengeQuestion
                ),
                title: lesson.title,
                contextKey: PlaygroundContext.lesson(lesson.id),
                scriptFilename: "\(lesson.id).py",
                codeTests: lesson.codeTests ?? [],
                lessonCommentHeader: PlaygroundContext.lessonCommentHeader(
                    lessonTitle: lesson.title,
                    lessonBody: lesson.body,
                    challengeQuestion: lesson.challengeQuestion
                )
            )
        } label: {
            Label("Open in Playground", systemImage: "terminal")
        }
        .buttonStyle(.borderedProminent)
    }

    private var canMarkComplete: Bool {
        if lesson.challengeQuestion != nil {
            return challengeCorrect || appState.isLessonComplete(lesson.id)
        }
        return true
    }

    private var completionButtons: some View {
        VStack(spacing: 8) {
            if lesson.challengeQuestion != nil, !challengeCorrect, !appState.isLessonComplete(lesson.id) {
                Text("Answer the quick check correctly before marking complete.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
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
            .disabled(!canMarkComplete && !appState.isLessonComplete(lesson.id))
        }
    }
}
