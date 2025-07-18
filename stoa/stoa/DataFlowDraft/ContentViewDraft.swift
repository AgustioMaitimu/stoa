//
//  ContentView2.swift
//  stoa
//
//  Created by Agustio Maitimu on 16/07/25.
//

import SwiftUI

struct ContentViewDraft: View {
	@State private var showCustomizationSheet: Bool = false
	@State var mindfulnessEnabled: Bool = true
	@State var breathingEnabled: Bool = true
	@State var extendedLengthEnabled: Bool = false
	
	var masterRecord = MasterRecord()
	
	var body: some View {
		NavigationStack {
			VStack(spacing: 40) {
				NavigationLink(value: "Start Session") {
					Text("Start Session")
				}
				VStack {
					
					Text(breathingEnabled ? "Breathing On" : "Breathing Off")
					Text(mindfulnessEnabled ? "Mindfulness On" : "Mindfulness Off")
					Text(extendedLengthEnabled ? "Extended On" : "Extended Off")
				}
				
				Button("Customize") {
					showCustomizationSheet.toggle()
				}
				
				NavigationLink(destination: SavedSessionsViewDraft()) {
					Text("Saved Sessions")
				}
			}
			.navigationDestination(for: String.self) { value in
				if value == "Start Session" {
					SessionViewDraft(currentSession: createSession())
				}
			}
			.sheet(isPresented: $showCustomizationSheet) {
				CustomizationViewDraft(breathingEnabled: $breathingEnabled, mindfulnessEnabled: $mindfulnessEnabled, extendedLengthEnabled: $extendedLengthEnabled)
					.presentationDetents([.medium])
					.presentationDragIndicator(.visible)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(.stoaDarkBlue)
			.foregroundStyle(.white)
		}
		.accentColor(.white)
	}
	
	func createSession() -> CurrentSession {
		CurrentSession(
			breathingTrack: breathingEnabled ? (extendedLengthEnabled ? masterRecord.breathingExtended.randomElement() : masterRecord.breathingNormal.randomElement()) : nil,
			
			
			mindfulnessTrack: mindfulnessEnabled ? (extendedLengthEnabled ? masterRecord.mindfulnessExtended.randomElement() : masterRecord.mindfulnessNormal.randomElement()) : nil,
			
			isExtended: extendedLengthEnabled
		)
	}
}

#Preview {
	ContentViewDraft()
}
