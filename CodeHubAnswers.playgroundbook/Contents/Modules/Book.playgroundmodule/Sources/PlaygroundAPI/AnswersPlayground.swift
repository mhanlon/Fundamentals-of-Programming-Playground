//
//  AnswersPlayground.swift
//  
//  Copyright © 2016-2019 Apple Inc. All rights reserved.
//

import Foundation

private let answersLiveViewClient = AnswersLiveViewClient()

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
}()

public func print(_ stringConvertible: CustomStringConvertible) {
    show(String(describing: stringConvertible))
}

/// Shows a string in the current playground page's live view.
/// - localizationKey: show(_ string:)
public func show(_ string: String) {
    answersLiveViewClient.show(string)
}

/// Shows a number in the current playground page's live view.
/// - localizationKey: show(_ number:)
public func show(_ number: Int) {
    answersLiveViewClient.show(String(number))
}

/// Shows a decimal in the current playground page's live view.
/// - localizationKey: show(_ decimal:)
public func show(_ decimal: Double) {
    answersLiveViewClient.show(String(decimal))
}

/// Shows a date in the current playground page's live view.
/// - localizationKey: show(_ date:)
public func show(_ date: Date) {
    answersLiveViewClient.show(dateFormatter.string(for: date) ?? "")
}

/// Asks for a string in the current playground page's live view.
/// - localizationKey: ask(_:)
public func ask(_ placeholder: String? = nil) -> String {
    return answersLiveViewClient.ask(forType: .string, placeholder: placeholder ?? "Input")
}

/// Asks for a number in the current playground page's live view.
/// - localizationKey: askForNumber(_:)
public func askForNumber(_ placeholder: String? = nil) -> Int {
    return Int(answersLiveViewClient.ask(forType: .number, placeholder: placeholder ?? "Number")) ?? 0
}

public func askForBool(_ placeholder: String? = nil) -> Bool {
    return Bool(answersLiveViewClient.ask(forType: .bool, placeholder: placeholder ?? "Bool")) ?? false
}

/// Asks for a decimal in the current playground page's live view.
/// - localizationKey: askForDecimal(_:)
public func askForDecimal(_ placeholder: String? = nil) -> Double {
    return Double(answersLiveViewClient.ask(forType: .decimal, placeholder: placeholder ?? "Decimal")) ?? 0
}

/// Asks for a date in the current playground page's live view.
/// - localizationKey: askForDate(_:)
public func askForDate(_ placeholder: String? = nil) -> Date {
    let dateString = answersLiveViewClient.ask(forType: .date, placeholder: placeholder ?? "Date")
    return dateFormatter.date(from:dateString) ?? Date()
}

/// Asks for a choice of string in the current playground page's live view, chosen from the array of options provided.
/// - localizationKey: askForChoice(_:options:)
public func askForChoice(_ placeholder: String? = nil, options: [String]) -> String {
    return answersLiveViewClient.ask(forType: .choice(options), placeholder: placeholder ?? "Choice")
}
