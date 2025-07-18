//
//  CardIconView.swift
//  stoa
//
//  Created by Wira Wibisana on 18/07/25.
//

import SwiftUI

struct CardIconPreviewHelper {
    static var randomAlphabet: String {
        CardIconViewModel.greekAlphabets.randomElement() ?? "α"
    }

    static var randomGradient: LinearGradient {
        CardIconViewModel.gradients.randomElement()!
    }
}

struct CardIconView: View {
    let alphabet: String
    let gradient: LinearGradient
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(gradient)
                .frame(width: 96, height: 96)
                // Inner shadow vvv
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.5), lineWidth: 1)
                        .offset(x: 1, y: 1)
                        .blur(radius: 1)
                        .mask(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [.black], startPoint: .topLeading, endPoint: .bottomTrailing)))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        .offset(x: -1, y: -1)
                        .blur(radius: 1)
                        .mask(RoundedRectangle(cornerRadius: 12).fill(LinearGradient(colors: [.white], startPoint: .bottomTrailing, endPoint: .topLeading)))
                )
            
            Text(alphabet)
                .font(.system(size: 54, weight: .bold))
                .foregroundColor(.white)
        }
        .frame(width: 96, height: 96)
    }
}

#Preview {
    let allConfigs = Array(CardIconViewModel.sessionIconMap.values)
    let randomConfig = allConfigs.randomElement()!
    CardIconView(alphabet: randomConfig.alphabet, gradient: randomConfig.gradient)
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
