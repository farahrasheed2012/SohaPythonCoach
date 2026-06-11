import Foundation

/// Lesson copy uses lightweight markdown (`**bold**`, `` `code` ``).
enum LessonTextFormatting {
    enum BlockKind {
        case text
        case bullet
        case numbered
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
    }

    /// One non-empty line per block — curriculum uses single newlines, which full Markdown collapses.
    static func displayBlocks(from source: String) -> [DisplayBlock] {
        let lines = source.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
        var blocks: [DisplayBlock] = []
        for line in lines {
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            guard !trimmed.isEmpty else { continue }
            blocks.append(
                DisplayBlock(
                    id: blocks.count,
                    text: trimmed,
                    kind: blockKind(for: trimmed)
                )
            )
        }
        return blocks
    }

    private static func blockKind(for line: String) -> BlockKind {
        if line.hasPrefix("- ") { return .bullet }
        if line.range(of: #"^\d+\.\s"#, options: .regularExpression) != nil { return .numbered }
        return .text
    }
}
