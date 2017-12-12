//  AnswersPlayground.swift

import Foundation

private let answersLiveViewClient = AnswersLiveViewClient()

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()

/// Shows a string in the current playground page's live view.
public func show(_ string: String) {
    answersLiveViewClient.show(string)
}

/// Asks for a string in the current playground page's live view.
public func ask(_ placeholder: String? = nil) -> String {
    return answersLiveViewClient.ask(forType: .string, placeholder: placeholder ?? "Input")
}
