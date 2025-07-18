//
//  ContentView.swift
//  Leern
//
//  Created by Agustio Maitimu on 05/07/25.
//

import SwiftUI

struct PauseButton: ButtonStyle {
    @State private var buttonOff: Bool = false
    private var offsetOn: CGFloat = -10
    private var offsetPressed: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.stoaLightGray)
                .frame(width: 108, height: 108)
                .clipShape(.rect(cornerRadius: 14))
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 108, height: 108)
                .clipShape(.rect(cornerRadius: 14))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Rectangle()
                .foregroundStyle(buttonOff ? .stoaPaused : .stoaGold)
                .frame(width: 95, height: 95)
                .clipShape(.rect(cornerRadius: 10))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Image(systemName: buttonOff ? "play.fill" : "pause.fill")
                .font(.system(size: 44))
                .fontWeight(.black)
                .foregroundStyle(.stoaGray)
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
        }
        .onChange(of: configuration.isPressed) {
            if configuration.isPressed {
                buttonOff.toggle()
            }
        }
    }
}

struct HapticsButton: ButtonStyle {
    @State private var buttonOff: Bool = false
    private var offsetOn: CGFloat = -10
    private var offsetPressed: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.stoaLightGray)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 14))
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 14))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Rectangle()
                .foregroundStyle(buttonOff ? .stoaPaused : .stoaGold)
                .frame(width: 70, height: 70)
                .clipShape(.rect(cornerRadius: 10))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Image(systemName: buttonOff ? "iphone.gen3" : "iphone.gen3.radiowaves.left.and.right")
                .font(.system(size: 32))
                .fontWeight(.medium)
                .foregroundStyle(.stoaGray)
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
        }
        .onChange(of: configuration.isPressed) {
            if configuration.isPressed {
                buttonOff.toggle()
            }
        }
    }
}

struct MuteButton: ButtonStyle {
    @State private var buttonOff: Bool = false
    private var offsetOn: CGFloat = -10
    private var offsetPressed: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.stoaLightGray)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 14))
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 14))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Rectangle()
                .foregroundStyle(buttonOff ? .stoaPaused : .stoaGold)
                .frame(width: 70, height: 70)
                .clipShape(.rect(cornerRadius: 10))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Image(systemName: buttonOff ? "speaker.slash.fill" : "speaker.wave.2.fill")
                .font(.system(size: 32))
                .fontWeight(.medium)
                .foregroundStyle(.stoaGray)
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
        }
        .onChange(of: configuration.isPressed) {
            if configuration.isPressed {
                buttonOff.toggle()
            }
        }
    }
}

struct FinishEarly: ButtonStyle {
    @State private var buttonOff: Bool = false
    private var offsetOn: CGFloat = -10
    private var offsetPressed: CGFloat = 0
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .foregroundStyle(.stoaLightGray)
                .frame(width: 277, height: 65)
            
            Rectangle()
                .foregroundStyle(.white)
                .frame(width: 277, height: 65)
                .clipShape(.rect(cornerRadius: 14))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Rectangle()
                .foregroundStyle(.stoaRed)
                .frame(width: 265, height: 55)
                .clipShape(.rect(cornerRadius: 10))
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
            
            Text("FINISH EARLY")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .offset(y: configuration.isPressed ? offsetPressed : offsetOn)
        }
        .onChange(of: configuration.isPressed) {
            if configuration.isPressed {
                buttonOff.toggle()
            }
        }
    }
}

struct ButtonTest: View {
    var body: some View {
        ZStack {
            Color(.green)
            Button("Finish Early") {
                
            }
            .buttonStyle(FinishEarly())
        }
    }
}

#Preview {
    ButtonTest()
}
