//
//  CardIconViewModel.swift
//  stoa
//
//  Created by Wira Wibisana on 18/07/25.
//

import SwiftUI

enum SessionType: Hashable {
    case breathingOnly
    case mindfulnessOnly
    case both

    static func from(breathingEnabled: Bool, mindfulnessEnabled: Bool) -> SessionType? {
        switch (breathingEnabled, mindfulnessEnabled) {
        case (true, false): return .breathingOnly
        case (false, true): return .mindfulnessOnly
        case (true, true):  return .both
        case (false, false): return nil
        }
    }
}

class CardIconViewModel: ObservableObject {
    static let greekAlphabets = ["α", "β", "γ"]

    static let gradients: [LinearGradient] = [
        // Top: Blue → Brown-Orange
        LinearGradient(colors: [Color(hex: "#5D9ECF"), Color(hex: "#D5894B")], startPoint: .top, endPoint: .bottom),

        // Middle: Slate → Lavender Gray
        LinearGradient(colors: [Color(hex: "#5A5F7C"), Color(hex: "#9195B3")], startPoint: .top, endPoint: .bottom),

        // Bottom: Warm Yellow → Sky Blue
        LinearGradient(colors: [Color(hex: "#F7C46C"), Color(hex: "#5FC1E2")], startPoint: .top, endPoint: .bottom)
    ]

    static let sessionIconMap: [SessionType: (alphabet: String, gradient: LinearGradient)] = [
        .breathingOnly: ("α", gradients[0]),
        .mindfulnessOnly: ("β", gradients[1]),
        .both: ("γ", gradients[2])
    ]

    @Published var selectedAlphabet: String
    @Published var selectedGradient: LinearGradient

    init() {
        let breathing = UserDefaults.standard.bool(forKey: "trackID_1001")
        let mindfulness = UserDefaults.standard.bool(forKey: "trackID_2001")

        guard let sessionType = SessionType.from(breathingEnabled: breathing, mindfulnessEnabled: mindfulness),
              let config = Self.sessionIconMap[sessionType] else {
            fatalError("Invalid session configuration: No feature enabled.")
        }

        selectedAlphabet = config.alphabet
        selectedGradient = config.gradient
    }
}
