import SwiftUI
import AppKit

struct PythonCodeEditor: NSViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSTextView.scrollableTextView()
        scrollView.hasVerticalScroller = true
        scrollView.autohidesScrollers = true

        guard let textView = scrollView.documentView as? NSTextView else {
            return scrollView
        }

        textView.delegate = context.coordinator
        textView.isRichText = false
        textView.font = NSFont.monospacedSystemFont(ofSize: NSFont.systemFontSize, weight: .regular)
        textView.isAutomaticQuoteSubstitutionEnabled = false
        textView.isAutomaticDashSubstitutionEnabled = false
        textView.isAutomaticTextReplacementEnabled = false
        textView.isAutomaticSpellingCorrectionEnabled = false
        textView.isContinuousSpellCheckingEnabled = false
        textView.string = text
        return scrollView
    }

    func updateNSView(_ scrollView: NSScrollView, context: Context) {
        guard let textView = scrollView.documentView as? NSTextView else { return }
        if textView.string != text {
            context.coordinator.isUpdating = true
            textView.string = text
            context.coordinator.isUpdating = false
        }
    }

    final class Coordinator: NSObject, NSTextViewDelegate {
        @Binding var text: String
        var isUpdating = false

        init(text: Binding<String>) {
            _text = text
        }

        func textDidChange(_ notification: Notification) {
            guard !isUpdating,
                  let textView = notification.object as? NSTextView else { return }
            text = textView.string
        }
    }
}

struct Card<Content: View>: View {
    let title: String
    var subtitle: String? = nil
    var accent: Color = .purple
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            content()
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(nsColor: .controlBackgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .strokeBorder(accent.opacity(0.25), lineWidth: 1)
        )
    }
}

struct CodeBlockView: View {
    let code: String
    var onCopy: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Python")
                    .font(.caption.weight(.semibold))
                    .foregroundStyle(.secondary)
                Spacer()
                if let onCopy {
                    Button("Copy", action: onCopy)
                        .controlSize(.small)
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                Text(code.trimmingCharacters(in: .whitespacesAndNewlines))
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(12)
        .background(Color(nsColor: .textBackgroundColor))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

/// Renders lesson body markdown (`**bold**`, `` `code` ``) with one line per block so lists stay readable.
struct LessonBodyText: View {
    let text: String

    private var blocks: [LessonTextFormatting.DisplayBlock] {
        LessonTextFormatting.displayBlocks(from: text)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(blocks) { block in
                blockView(block)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, topSpacing(for: block))
            }
        }
    }

    @ViewBuilder
    private func blockView(_ block: LessonTextFormatting.DisplayBlock) -> some View {
        switch block.kind {
        case .code:
            CodeBlockView(code: block.text) {
                ClipboardHelper.copy(block.text)
            }
        default:
            inlineMarkdown(block.text)
        }
    }

    private func topSpacing(for block: LessonTextFormatting.DisplayBlock) -> CGFloat {
        guard block.id > 0 else { return 0 }
        let previous = blocks[block.id - 1]
        switch (previous.kind, block.kind) {
        case (.bullet, .bullet), (.numbered, .numbered):
            return 4
        default:
            return 10
        }
    }

    @ViewBuilder
    private func inlineMarkdown(_ line: String) -> some View {
        if let attributed = try? AttributedString(
            markdown: line,
            options: AttributedString.MarkdownParsingOptions(
                interpretedSyntax: .inlineOnlyPreservingWhitespace,
                failurePolicy: .returnPartiallyParsedIfPossible
            )
        ) {
            Text(attributed)
        } else {
            Text(LessonTextFormatting.plainText(from: line))
        }
    }
}

struct ProgressRing: View {
    let fraction: Double
    var label: String

    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Circle()
                    .stroke(Color.secondary.opacity(0.2), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: fraction)
                    .stroke(
                        AngularGradient(colors: [.purple, .blue, .cyan], center: .center),
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                Text("\(Int(fraction * 100))%")
                    .font(.title2.bold().monospacedDigit())
            }
            .frame(width: 88, height: 88)
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

struct SkillPill: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.purple.opacity(0.12))
            .clipShape(Capsule())
    }
}

extension View {
    func coachPageBackground() -> some View {
        background(Color(nsColor: .windowBackgroundColor))
    }
}

enum ClipboardHelper {
    static func copy(_ text: String) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
    }
}
