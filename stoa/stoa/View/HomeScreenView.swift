//
//  HomeScreen.swift
//
//
//  Created by Wira Wibisana on 15/07/25.
//
import SwiftUI

struct HomeScreen: View {
	@State private var navigationPath = NavigationPath()
	@State private var showCustomizationSheet: Bool = false
	@State var mindfulnessEnabled: Bool = true
	@State var breathingEnabled: Bool = true
	@State var extendedLengthEnabled: Bool = false
	@State private var shouldNavigate = false
	
	var masterRecord = MasterRecord()
	
	var body: some View {
		NavigationStack(path: $navigationPath) {
			ZStack{
				Rectangle()
					.fill(Color.stoaDarkBlue)
					.ignoresSafeArea()
				
				GIFView(gifName: "scribbleRestless")
					.frame(width: 324, height: 324)
					.offset(y: -24)
					.allowsHitTesting(false) // Keeps the GIF from being interactive
				
				VStack{
					NavigationLink(destination: CollectionView()) {
						ZStack{
							RoundedRectangle(cornerRadius: 10)
								.fill(Color.stoaBlack)
							HStack{
								Text("Collection")
									.font(Font.custom("AveriaSerifLibre-Bold", size: 17, relativeTo: .body))
								Image(systemName: "bookmark.fill")
							}
							.foregroundStyle(.stoaGold)
						}
						.frame(width: 140, height: 32)
					}
					.offset(y: 50)
					
					
					Text("Tap anywhere to start")
						.font(Font.custom("AveriaSerifLibre-Regular", size: 20))
						.kerning(0.4)
						.multilineTextAlignment(.center)
						.foregroundColor(.gray)
						.offset(y: 118)
					
					Spacer()
					
					Button("Customize") {
						showCustomizationSheet.toggle()
					}
					.font(Font.custom("AveriaSerifLibre-Bold", size: 17, relativeTo: .body))
					.foregroundColor(.stoaGold)
					.padding()
					
				}
			}
			.onTapGesture {
				shouldNavigate = true
			}
			.onChange(of: shouldNavigate) { _, newValue in
				if newValue {
					// Use a unique identifier to ensure navigation always works
					navigationPath.append("SessionView-\(UUID().uuidString)")
					shouldNavigate = false
				}
			}
			.navigationDestination(for: String.self) { destination in
				if destination.hasPrefix("SessionView") {
					SessionViewDraft(currentSession: createSession(), navigationPath: $navigationPath)
				} else {
					EmptyView()
				}
			}
			.navigationDestination(for: CurrentSession.self) { session in
				FinishedViewDraft(currentSession: session, navigationPath: $navigationPath)
			}
			.sheet(isPresented: $showCustomizationSheet) {
				CustomizationView(
					breathingEnabled: $breathingEnabled,
					mindfulnessEnabled: $mindfulnessEnabled,
					extendedLengthEnabled: $extendedLengthEnabled
				)
				.presentationDragIndicator(.visible)
				// This modifier colors the dividers within the sheet's List or Form
				.listRowSeparatorTint(Color.stoaLightBlue)
			}
		}
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
	HomeScreen()
}
