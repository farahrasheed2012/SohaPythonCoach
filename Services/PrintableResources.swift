import Foundation
import AppKit

enum PrintableResources {
    enum Document: String {
        case workbook = "python-coach-workbook"
        case teacherScript = "python-coach-teacher-script"
    }

    static func url(for document: Document) -> URL? {
        Bundle.main.url(forResource: document.rawValue, withExtension: "html", subdirectory: "Printable")
            ?? Bundle.main.url(forResource: document.rawValue, withExtension: "html")
    }

    static func open(_ document: Document) {
        guard let url = url(for: document) else { return }
        NSWorkspace.shared.open(url)
    }
}
