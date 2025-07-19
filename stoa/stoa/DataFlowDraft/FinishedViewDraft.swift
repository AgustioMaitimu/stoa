//
//  FinishedViewDraft.swift
//  stoa
//
//  Created by Agustio Maitimu on 17/07/25.
//

import SwiftUI

struct FinishedViewDraft: View {
	@Environment(\.modelContext) var modelContext
	var currentSession: CurrentSession
	@Binding var navigationPath: NavigationPath
	@State var isSaving = false
	
	var body: some View {
		VStack {
			HStack {
				Toggle("Show Draft", isOn: $isSaving)
					.labelsHidden()
				Text("Save Session")
			}
			
			Button("Finish") {
				if isSaving {
					modelContext.insert(createSavedSession())
					try? modelContext.save()
				}
				
				// Navigate back to home screen by clearing the navigation path
				navigationPath = NavigationPath()
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.stoaDarkBlue)
		.navigationBarBackButtonHidden(true)
	}
	
	func createSavedSession() -> SavedSession {
		SavedSession(
			breathingTrack: currentSession.breathingTrack,
			mindfulnessTrack: currentSession.mindfulnessTrack,
			isExtended: currentSession.isExtended,
			date: Date()
		)
	}
}
