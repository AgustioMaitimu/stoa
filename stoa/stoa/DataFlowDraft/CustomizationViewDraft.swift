//
//  CustomizationView2.swift
//  stoa
//
//  Created by Agustio Maitimu on 16/07/25.
//

import SwiftUI

struct CustomizationViewDraft: View {
	@Binding var breathingEnabled: Bool
	@Binding var mindfulnessEnabled: Bool
	@Binding var extendedLengthEnabled: Bool
	
	var body: some View {
		VStack {
			HStack {
				Text("Breathing")
				Toggle("Enabled", isOn: $breathingEnabled)
					.labelsHidden()
			}
			
			HStack {
				Text("Mindfulness")
				Toggle("Enabled", isOn: $mindfulnessEnabled)
					.labelsHidden()
			}
			
			HStack {
				Text("Extended Length")
				Toggle("Enabled", isOn: $extendedLengthEnabled)
					.labelsHidden()
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.stoaDarkerBlue)
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

//#Preview {
//	CustomizationViewDraft()
//}
