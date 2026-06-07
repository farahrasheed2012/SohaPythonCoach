import Foundation

enum ChallengeValidator {
    /// Returns true if the student's answer matches any accepted form.
    static func isCorrect(answer: String, accepted: [String]) -> Bool {
        let normalized = normalize(answer)
        guard !normalized.isEmpty else { return false }

        for candidate in accepted {
            let c = normalize(candidate)
            if c.isEmpty { continue }
            if normalized == c { return true }
            if normalized.contains(c) || c.contains(normalized) { return true }
            // Multi-word answers: all keywords present
            let keywords = c.split(separator: " ").map(String.init).filter { $0.count > 2 }
            if keywords.count >= 2, keywords.allSatisfy({ normalized.contains($0) }) {
                return true
            }
        }
        return false
    }

    private static func normalize(_ text: String) -> String {
        text
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "_", with: " ")
            .replacingOccurrences(of: "-", with: " ")
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
}
