//
//  Models.swift
//  stoa
//
//  Created by Agustio Maitimu on 15/07/25.
//

import Foundation
import SwiftData

class CurrentSession {
	var breathingTrack: AudioTrack?
	var mindfulnessTrack: AudioTrack?
	var isExtended: Bool?
	
	init(breathingTrack: AudioTrack?, mindfulnessTrack: AudioTrack?, isExtended: Bool? = nil) {
		self.breathingTrack = breathingTrack
		self.mindfulnessTrack = mindfulnessTrack
		self.isExtended = isExtended
	}
}

class SavedSession: Identifiable {
	var id: UUID
	var breathingTrack: AudioTrack?
	var mindfulnessTrack: AudioTrack?
	var isExtended: Bool?
	var date: Date?
	
	init(id: UUID, breathingTrack: AudioTrack? = nil, mindfulnessTrack: AudioTrack? = nil, isExtended: Bool? = nil) {
		self.id = id
		self.breathingTrack = breathingTrack
		self.mindfulnessTrack = mindfulnessTrack
		self.isExtended = isExtended
	}
}

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

class Step {
	var time : Float
	var text : String
	
	init(time: Float, text: String) {
		self.time = time
		self.text = text
	}
}

