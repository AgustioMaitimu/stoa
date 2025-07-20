//
//  CardIconView.swift
//  stoa
//
//  Created by Wira Wibisana on 18/07/25.
//

import SwiftUI

struct CardIconView: View {
	let savedSession: SavedSession
	
	private enum SessionType: Hashable {
		case breathingOnly
		case mindfulnessOnly
		case both
		
		static func from(savedSession: SavedSession) -> SessionType? {
			let hasBreathing = savedSession.breathingTrack != nil
			let hasMindfulness = savedSession.mindfulnessTrack != nil
			
			switch (hasBreathing, hasMindfulness) {
			case (true, false): return .breathingOnly
			case (false, true): return .mindfulnessOnly
			case (true, true):  return .both
			case (false, false): return nil
			}
		}
	}
	
	private static let gradients: [LinearGradient] = [
		// Top: Blue → Brown-Orange
		LinearGradient(colors: [Color(hex: "#5D9ECF"), Color(hex: "#D5894B")], startPoint: .top, endPoint: .bottom),
		
		// Middle: Slate → Lavender Gray
		LinearGradient(colors: [Color(hex: "#5A5F7C"), Color(hex: "#9195B3")], startPoint: .top, endPoint: .bottom),
		
		// Bottom: Warm Yellow → Sky Blue
		LinearGradient(colors: [Color(hex: "#F7C46C"), Color(hex: "#5FC1E2")], startPoint: .top, endPoint: .bottom)
	]
	
	private static let sessionIconMap: [SessionType: (alphabet: String, gradient: LinearGradient)] = [
		.breathingOnly: ("α", gradients[0]),
		.mindfulnessOnly: ("β", gradients[1]),
		.both: ("γ", gradients[2])
	]
	
	private var alphabet: String {
		guard let sessionType = SessionType.from(savedSession: savedSession),
			  let config = Self.sessionIconMap[sessionType] else {
			return "Ω"
		}
		return config.alphabet
	}
	
	private var gradient: LinearGradient {
		guard let sessionType = SessionType.from(savedSession: savedSession),
			  let config = Self.sessionIconMap[sessionType] else {
			return LinearGradient(colors: [.gray], startPoint: .top, endPoint: .bottom)
		}
		return config.gradient
	}
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.fill(gradient)
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
					.font(.system(size: geometry.size.width * 0.56, weight: .bold)) // Font size now scales
					.foregroundColor(.white)
			}
		}
	}
}

#Preview {
	// Note: You'll need to create a dummy SavedSession for the preview to work
	let dummySession = SavedSession(breathingTrack: AudioTrack(trackID: 1, trackType: "Breathing", trackLength: "Normal", steps: []), mindfulnessTrack: nil)
	return CardIconView(savedSession: dummySession)
		.frame(width: 63, height: 63)
}
