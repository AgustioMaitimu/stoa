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
				NavigationLink(value: "To Session") {
									Text("Navigation Link")
								}
				
				VStack {
					
					Text(breathingEnabled ? "Breathing On" : "Breathing Off")
					Text(mindfulnessEnabled ? "Mindfulness On" : "Mindfulness Off")
					Text(extendedLengthEnabled ? "Extended On" : "Extended Off")
				}
				
				Button("Customize") {
					showCustomizationSheet.toggle()
				}
			}
			.navigationDestination(for: String.self) { value in
				if value == "To Session" {
					SessionViewDraft(currentSession: createSession())
				}
			}
			.sheet(isPresented: $showCustomizationSheet) {
				CustomizationViewDraft(breathingEnabled: $breathingEnabled, mindfulnessEnabled: $mindfulnessEnabled, extendedLengthEnabled: $extendedLengthEnabled)
					.presentationDetents([.medium])
					.presentationDragIndicator(.visible)
			}
			
		}
	}
	
	func createSession() -> CurrentSession {
		CurrentSession(
			breathingTrack: breathingEnabled ? (extendedLengthEnabled ? masterRecord.breathingExtended.randomElement() : masterRecord.breathingNormal.randomElement()) : nil,
			
			
			mindfulnessTrack: mindfulnessEnabled ? (extendedLengthEnabled ? masterRecord.mindfulnessExtended.randomElement() : masterRecord.mindfulnessNormal.randomElement()) : nil
			)
	}
}

#Preview {
	ContentViewDraft()
}
