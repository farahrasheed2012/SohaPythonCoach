import Foundation

/// Lesson copy uses lightweight markdown (`**bold**`, `` `code` ``) — strip for plain text.
enum LessonTextFormatting {
    static func plainText(from source: String) -> String {
        source
            .replacingOccurrences(of: "**", with: "")
            .replacingOccurrences(of: "`", with: "")
    }
}
