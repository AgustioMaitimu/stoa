//
//  Models.swift
//  stoa
//
//  Created by Agustio Maitimu on 15/07/25.
//

import Foundation
import SwiftData

class CurrentSession: Hashable {
	var id = UUID()
	var breathingTrack: AudioTrack?
	var mindfulnessTrack: AudioTrack?
	var isExtended: Bool?
	
	init(breathingTrack: AudioTrack?, mindfulnessTrack: AudioTrack?, isExtended: Bool? = nil) {
		self.breathingTrack = breathingTrack
		self.mindfulnessTrack = mindfulnessTrack
		self.isExtended = isExtended
	}
	
	static func == (lhs: CurrentSession, rhs: CurrentSession) -> Bool {
		lhs.id == rhs.id // or compare relevant properties
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(id) // or combine relevant properties
	}
}

@Model
class SavedSession: Identifiable {
	var id = UUID()
	var breathingTrack: AudioTrack?
	var mindfulnessTrack: AudioTrack?
	var isExtended: Bool?
	var date: Date?
	
	init(id: UUID = UUID(), breathingTrack: AudioTrack? = nil, mindfulnessTrack: AudioTrack? = nil, isExtended: Bool? = nil, date: Date? = nil) {
		self.id = id
		self.breathingTrack = breathingTrack
		self.mindfulnessTrack = mindfulnessTrack
		self.isExtended = isExtended
		self.date = date
	}
}

@Model
class AudioTrack {
	var trackID : Int
	var trackType : String
	var trackLength : String
	var steps : [Step]
	
	init(trackID: Int, trackType: String, trackLength: String, steps: [Step]) {
		self.trackID = trackID
		self.trackType = trackType
		self.trackLength = trackLength
		self.steps = steps
	}
}

@Model
class Step {
    var time : Double
	var text : String
	
    init(time: Double, text: String) {
		self.time = time
		self.text = text
	}
}

