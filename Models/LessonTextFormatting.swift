import Foundation

/// Lesson copy uses lightweight markdown (`**bold**`, `` `code` ``, fenced blocks).
enum LessonTextFormatting {
    enum BlockKind {
        case text
        case bullet
        case numbered
        case code
    }

    struct DisplayBlock: Identifiable {
        let id: Int
        let text: String
        let kind: BlockKind
    }

    static func plainText(from source: String) -> String {
        source
            .replacingOccurrences(of: "**", with: "")
            .replacingOccurrences(of: "`", with: "")
            .replacingOccurrences(of: "```", with: "")
    }

    /// Splits body into text lines and fenced ``` code ``` blocks.
    static func displayBlocks(from source: String) -> [DisplayBlock] {
        var blocks: [DisplayBlock] = []
        var inFence = false
        var fenceLines: [String] = []

        func flushFence() {
            guard !fenceLines.isEmpty else { return }
            blocks.append(
                DisplayBlock(id: blocks.count, text: fenceLines.joined(separator: "\n"), kind: .code)
            )
            fenceLines = []
        }

        for line in source.split(separator: "\n", omittingEmptySubsequences: false).map(String.init) {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            if trimmed.hasPrefix("```") {
                if inFence {
                    flushFence()
                    inFence = false
                } else {
                    inFence = true
                }
                continue
            }
            if inFence {
                fenceLines.append(line)
                continue
            }
            guard !trimmed.isEmpty else { continue }
            blocks.append(
                DisplayBlock(
                    id: blocks.count,
                    text: trimmed,
                    kind: blockKind(for: trimmed)
                )
            )
        }
        if inFence {
            flushFence()
        }
        return blocks
    }

    private static func blockKind(for line: String) -> BlockKind {
        if line.hasPrefix("- ") { return .bullet }
        if line.range(of: #"^\d+\.\s"#, options: .regularExpression) != nil { return .numbered }
        return .text
    }
}
