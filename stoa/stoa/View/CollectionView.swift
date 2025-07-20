//
//  SavedSessionsDraft.swift
//  stoa
//
//  Created by Agustio Maitimu on 17/07/25.
//

import SwiftUI
import SwiftData

struct CollectionView: View {
	@Query(sort: \SavedSession.date, order: .reverse) var savedSessions: [SavedSession]
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading, spacing: 20) {
					pinnedSessionHeader()
					
					savedSessionsList()
				}
				.padding(.horizontal)
			}
			.foregroundStyle(.white)
			.background(.stoaDarkBlue)
			.navigationTitle("Collection")
			.navigationBarTitleDisplayMode(.large)
			.toolbarBackground(.visible, for: .navigationBar)
			.toolbarBackground(.stoaDarkerBlue, for: .navigationBar)
		}
	}
	
	private func pinnedSessionHeader() -> some View {
		VStack(alignment: .leading) {
			Text("Pinned Session")
				.font(.system(size: 20, weight: .medium))
				.padding(.leading, 8)
				.padding(.top)
			Rectangle()
				.frame(maxWidth: .infinity, maxHeight: 1)
				.opacity(0.5)
		}
	}
	
	private func savedSessionsList() -> some View {
		VStack(alignment: .leading) {
			Text("Saved Sessions")
				.font(.system(size: 20, weight: .medium))
				.padding(.leading, 8)
			
			if savedSessions.isEmpty {
				Text("No saved sessions yet.")
					.foregroundColor(.gray)
					.padding(.leading, 16)
					.padding(.top, 10)
			} else {
				ForEach(savedSessions) { savedSession in
					SavedSessionRow(savedSession: savedSession)
				}
			}
		}
	}
}

struct SavedSessionRow: View {
	let savedSession: SavedSession
	
	var body: some View {
		HStack {
			CardIconView(savedSession: savedSession)
				.frame(width: 63, height: 63)
			
			VStack(alignment: .leading, spacing: 4) {
				HStack(spacing: 5) {
					Text("Session Details")
						.font(.title2.bold())
					Image(systemName: "chevron.right")
						.font(.title3.bold())
				}
				
				if let date = savedSession.date {
					Text(date, style: .date)
						.font(.caption)
				}
				
				HStack {
					Text("Breathe")
						.opacity(savedSession.breathingTrack != nil ? 1 : 0.5)
					Text("Mindfulness")
						.opacity(savedSession.mindfulnessTrack != nil ? 1 : 0.5)
					Text("Extended")
						.opacity(savedSession.isExtended ?? false ? 1 : 0.5)
				}
				.font(.caption)
			}
			.frame(maxHeight: .infinity, alignment: .center)
			
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


extension Date {
	func formattedAsDDMMYYYY() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd/MM/yyyy"
		return formatter.string(from: self)
	}
}


#Preview {
	CollectionView()
		.modelContainer(for: SavedSession.self, inMemory: true)
}
