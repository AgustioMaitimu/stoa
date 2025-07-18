//
//  SavedSessionsDraft.swift
//  stoa
//
//  Created by Agustio Maitimu on 17/07/25.
//

import SwiftUI
import SwiftData

struct SavedSessionsViewDraft: View {
	@Query var savedSessions: [SavedSession]
	
	var body: some View {
		NavigationStack {
			VStack {
				VStack(alignment: .leading, spacing: 20) {
					VStack {
						Text("Pinned Session")
							.font(.title2)
							.padding(.leading, 16)
							.padding(.top)
					}
					Rectangle()
						.frame(maxWidth: .infinity, maxHeight: 1)
						.opacity(0.5)
					
					VStack(alignment: .leading) {
						Text("Saved Sessions")
							.font(.title2)
							.padding(.leading, 16)
						
						ForEach(savedSessions) { savedSession in
							HStack {
								Image(.icon1)
									.resizable()
									.frame(width: 63, height: 63)
								
								VStack(alignment: .leading) {
									Spacer()
									
									HStack(spacing: 5) {
										Text("Sehr Gut")
											.font(.title2.bold())
										Image(systemName: "chevron.right")
											.font(.title3.bold())
									}
									
									Spacer()
									
									Text(TimeInterval((savedSession.mindfulnessTrack?.steps.last?.time ?? 0) + (savedSession.breathingTrack?.steps.last?.time ?? 0)).formattedString())
										.font(.callout)
									
									Spacer()
									
									HStack {
										Text("Breathe")
											.opacity(savedSession.breathingTrack != nil ? 1 : 0.5)
										
										Text("Mindfulness")
											.opacity(savedSession.mindfulnessTrack != nil ? 1 : 0.5)
										Text("Extended")
											.opacity(savedSession.isExtended ?? false ? 1 : 0.5)
									}
									.font(.caption)
									
									Spacer()
								}
								
								Spacer()
								
								Image(systemName: "pin.circle")
									.font(.largeTitle)
									.padding(.trailing, 9)
							}
							.frame(maxHeight: 63)
							.padding(9)
							.background(.black.opacity(0.4))
							.clipShape(.rect(cornerRadius: 10))
						}
					}
				}
				.padding(.horizontal)
				
				Spacer()
			}
			.foregroundStyle(.white)
			.background(.stoaDarkBlue)
			.navigationTitle("Collection")
			.navigationBarTitleDisplayMode(.large)
			.toolbarBackground(.visible, for: .navigationBar)
			.toolbarBackground(.stoaDarkerBlue, for: .navigationBar)
		}
	}
}

extension TimeInterval {
	func formattedString() -> String {
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.minute, .second]
		formatter.unitsStyle = .abbreviated
		formatter.zeroFormattingBehavior = .pad
		
		return formatter.string(from: self) ?? "0s"
	}
}

#Preview {
	SavedSessionsViewDraft()
}
