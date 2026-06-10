import Foundation

enum ChallengeValidator {
    /// Returns true if the student's answer matches any accepted form.
    static func isCorrect(answer: String, accepted: [String]) -> Bool {
        guard !looksLikeCodePaste(answer) else { return false }

        let normalized = normalize(answer)
        guard !normalized.isEmpty else { return false }

        for candidate in accepted {
            if matches(normalized: normalized, candidate: normalize(candidate)) {
                return true
            }
        }
        return false
    }

    /// True when the text looks like copied starter code rather than a short quiz reply.
    static func looksLikeCodePaste(_ text: String) -> Bool {
        if text.contains("\n") { return true }

        let lower = text.lowercased()
        let strongSignals = [
            "def ", "import ", "for ", "while ", "class ", "with open", "elif ",
            "try:", "except", "f.write", "f.read", "filename =", "self.", "pygame.",
            "tkinter.", "flask.", "pandas.", "matplotlib.", "random.", "json.",
        ]
        if strongSignals.contains(where: { lower.contains($0) }) { return true }

        let mildSignals = ["print(", "input(", "range(", "+=", "==", "!="]
        let mildCount = mildSignals.filter { lower.contains($0) }.count
        if mildCount >= 2 { return true }
        if mildCount >= 1, text.count > 28 { return true }
        if mildSignals.contains(where: { lower.contains($0) }),
           text.contains("\"") || text.contains("'") {
            return true
        }

        let codeChars = text.filter { "{}[]();=".contains($0) }.count
        return text.count > 24 && codeChars >= 3
    }

    private static func matches(normalized: String, candidate: String) -> Bool {
        guard !candidate.isEmpty else { return false }
        if normalized == candidate { return true }

        let answerTokens = tokens(from: normalized)
        let candidateTokens = tokens(from: candidate)

        if candidateTokens.count == 1, let word = candidateTokens.first {
            if word.allSatisfy(\.isNumber) {
                return answerTokens == [word] || normalized == word
            }
            if word.count <= 3 {
                if normalized.count > max(20, word.count * 5) { return false }
                return answerTokens == [word] || normalized == word
            }
            if normalized.count > 48 { return false }
            return answerTokens.contains(word)
        }

        if candidateTokens.count >= 2 {
            let keywords = candidateTokens.filter { $0.count > 2 }
            if keywords.count >= 2,
               keywords.allSatisfy({ normalized.contains($0) }),
               normalized.count <= 120 {
                return true
            }
        }

        if normalized.count <= 80, candidate.count >= 4 {
            if normalized.contains(candidate) || candidate.contains(normalized) {
                return true
            }
        }

        return false
    }

    private static func tokens(from text: String) -> [String] {
        text
            .lowercased()
            .components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
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
