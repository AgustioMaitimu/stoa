// stoa/View/CustomizationView.swift

import SwiftUI
import StoreKit


struct PillSwitchStyle: ToggleStyle {
	var onColor: Color
	var offColor: Color
	var thumbColor: Color
	
	func makeBody(configuration: Configuration) -> some View {
		Button(action: {
			withAnimation(.spring()) {
				configuration.isOn.toggle()
			}
		}) {
			ZStack(alignment: configuration.isOn ? .trailing : .leading) {
				Capsule()
					.fill(configuration.isOn ? onColor : offColor)
					.frame(width: 64, height: 28)
				
				// Thumb: Adjusted proportions.
				Capsule()
					.fill(thumbColor)
					.frame(width: 36, height: 22)
					.padding(3)
			}
		}
		.buttonStyle(PlainButtonStyle())
	}
}


struct CustomizationView: View {
	@Environment(\.requestReview) private var requestReview
	
	@Binding var breathingEnabled: Bool
	@Binding var mindfulnessEnabled: Bool
	@Binding var extendedLengthEnabled: Bool
	
	@State private var voiceGuideEnabled: Bool = true
	@State private var musicEnabled: Bool = true
	@State private var hapticsEnabled: Bool = true
	@State private var reduceMotionEnabled: Bool = false
	@State private var philosopherQuotesEnabled: Bool = true
	
	var body: some View {
		NavigationStack {
			Form {
				Section(header: Text("CUSTOMIZE YOUR SESSION")) {
					HStack {
						Text("Breathing Exercise")
							.foregroundColor(.stoaCream)
						Spacer()
						Toggle("Enabled", isOn: $breathingEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
					
					HStack {
						Text("Mindfulness Prompts")
							.foregroundColor(.stoaCream)
						Spacer()
						Toggle("Enabled", isOn: $mindfulnessEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
					
					HStack {
						Text("Extended Duration")
							.foregroundColor(.stoaCream)
						Spacer()
						Toggle("Enabled", isOn: $extendedLengthEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
				}
				.listRowBackground(Color.stoaBrown)
				
				Section(header: Text("CONTROLS")) {
					HStack {
						HStack {
							Image(systemName: "speaker.wave.2.fill")
							Text("Voice Guide")
						}
						.foregroundColor(.stoaCream)
						
						Spacer()
						Toggle("Enabled", isOn: $voiceGuideEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
					
					HStack {
						HStack {
							Image(systemName: "music.note.list")
							Text("Music")
						}
						.foregroundColor(.stoaCream)
						
						Spacer()
						Toggle("Enabled", isOn: $musicEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
					
					HStack {
						HStack {
							Image(systemName: "iphone.gen3.radiowaves.left.and.right")
							Text("Haptics")
						}
						.foregroundColor(.stoaCream)
						
						Spacer()
						Toggle("Enabled", isOn: $hapticsEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
				}
				.listRowBackground(Color.stoaBrown)
				
				Section {
					HStack {
						Text("Reduce Motion")
							.foregroundColor(.stoaCream)
						Spacer()
						Toggle("Enabled", isOn: $reduceMotionEnabled)
							.labelsHidden()
							.toggleStyle(PillSwitchStyle(onColor: .stoaGold, offColor: .stoaLightBrown, thumbColor: .white))
					}
				}
				.listRowBackground(Color.stoaBrown)
				
				Section {
					ZStack {
						NavigationLink(destination: PhilosopherQuotesView()) {
							EmptyView()
						}
						.opacity(0)
						
						HStack {
							Image(systemName: "brain.head.profile.fill")
							Text("Philosopher Quotes")
							Spacer()
							Image(systemName: "chevron.right")
						}
						.foregroundColor(.stoaCream)
					}
				}
				.listRowBackground(Color.stoaBrown)
				
				Section {
					Button(action: {
						requestReview()
					}) {
						HStack {
							Image(systemName: "star.fill")
							Text("Rate App")
							Spacer()
							Image(systemName: "chevron.right")
						}
						.foregroundColor(.stoaCream)
					}
				}
				.listRowBackground(Color.stoaBrown)
				
				Section {
					ZStack {
						NavigationLink(destination: Text("Hi")) {
							EmptyView()
						}
						.opacity(0)
						
						HStack {
							Image(systemName: "globe")
							Text("About Us")
							Spacer()
							Image(systemName: "chevron.right")
						}
						.foregroundColor(.stoaCream)
					}
				}
				.listRowBackground(Color.stoaBrown)
			}
			.padding(.top, 48)
			.listSectionSpacing(16)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(.stoaBlack)
			.scrollContentBackground(.hidden)
			.onChange(of: breathingEnabled) {
				if !breathingEnabled && !mindfulnessEnabled {
					mindfulnessEnabled = true
				}
			}
			.onChange(of: mindfulnessEnabled) {
				if !breathingEnabled && !mindfulnessEnabled {
					breathingEnabled = true
				}
			}
		}
	}
}
