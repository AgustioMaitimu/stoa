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

class MasterRecord {
	var breathingNormal = [
		AudioTrack(
			trackID: 1001,
			trackType: "Breathing",
			trackLength: "Normal",
			steps: [
				Step(time: 0.033, text: "Let's take a moment to breathe, and truly feel it."),
				Step(time: 5.366, text: "Bring your attention to your breath."),
				Step(time: 8.566, text: "You don't need to change it, just notice it."),
				Step(time: 13.0, text: "Feel the air entering your body, and gently leaving."),
				Step(time: 18.6, text: "Let each breath remind you."),
				Step(time: 21.566, text: "I am here, I am enough, now inhale slowly."),
				Step(time: 33.166, text: "Exhale gently."),
				Step(time: 39.633, text: "Again, inhale."),
				Step(time: 45.466, text: "Exhale gently.")
			]
		),
		AudioTrack(
			trackID: 1002,
			trackType: "Breathing",
			trackLength: "Normal",
			steps: [
				Step(time: 0.033, text: "Let's take a moment to breathe, and truly feel it."),
				Step(time: 5.366, text: "Bring your attention to your breath."),
				Step(time: 8.566, text: "You don't need to change it, just notice it."),
				Step(time: 13.0, text: "Feel the air entering your body, and gently leaving."),
				Step(time: 18.6, text: "Let each breath remind you."),
				Step(time: 21.566, text: "I am here, I am enough, now inhale slowly."),
				Step(time: 33.166, text: "Exhale gently."),
				Step(time: 39.633, text: "Again, inhale."),
				Step(time: 45.466, text: "Exhale gently.")
			]
		),
	]
	
	var breathingExtended = [
		AudioTrack(
			trackID: 1003,
			trackType: "Breathing",
			trackLength: "Extended",
			steps: [
				Step(time: 0.033, text: "Let's take a moment to breathe, and truly feel it."),
				Step(time: 5.366, text: "Bring your attention to your breath."),
				Step(time: 8.566, text: "You don't need to change it, just notice it."),
				Step(time: 13.0, text: "Feel the air entering your body, and gently leaving."),
				Step(time: 18.6, text: "Let each breath remind you."),
				Step(time: 21.566, text: "I am here, I am enough, now inhale slowly."),
				Step(time: 33.166, text: "Exhale gently."),
				Step(time: 39.633, text: "Again, inhale."),
				Step(time: 45.466, text: "Exhale gently.")
			]
		),
		AudioTrack(
			trackID: 1004,
			trackType: "Breathing",
			trackLength: "Extended",
			steps: [
				Step(time: 0.033, text: "Let's take a moment to breathe, and truly feel it."),
				Step(time: 5.366, text: "Bring your attention to your breath."),
				Step(time: 8.566, text: "You don't need to change it, just notice it."),
				Step(time: 13.0, text: "Feel the air entering your body, and gently leaving."),
				Step(time: 18.6, text: "Let each breath remind you."),
				Step(time: 21.566, text: "I am here, I am enough, now inhale slowly."),
				Step(time: 33.166, text: "Exhale gently."),
				Step(time: 39.633, text: "Again, inhale."),
				Step(time: 45.466, text: "Exhale gently.")
			]
		)
	]
	
	var mindfulnessNormal = [
		AudioTrack(
			trackID: 2001,
			trackType: "Mindfulness",
			trackLength: "Normal",
			steps: [
				Step(time: 0.0, text: "Let’s take a moment to pause."),
				Step(time: 4.5, text: "Bring your attention gently to yourself."),
				Step(time: 7.5, text: "Not to your to-do list."),
				Step(time: 10.0, text: "Not to your worries."),
				Step(time: 11.8, text: "Just… you."),
				Step(time: 14.7, text: "Let your thoughts settle, even just a little."),
				Step(time: 19.8, text: "Now ask yourself—"),
				Step(time: 21.9, text: "What is already here… supporting you?"),
				Step(time: 26.1, text: "What quietly holds you together, even when you don’t notice?"),
				Step(time: 32.0, text: "The Stoic philosopher Epictetus once said: “He is a wise man who does not grieve for the things which he has not, but rejoices for those which he has.”"),
				Step(time: 46.0, text: "So now, in your mind, begin to name the small things you’ve been given."),
				Step(time: 52.0, text: "A heart that beats."),
				Step(time: 54.5, text: "A mind that can think, imagine, remember."),
				Step(time: 57.9, text: "Moments of laughter."),
				Step(time: 60.0, text: "People who care about you—even if quietly, from a distance."),
				Step(time: 64.7, text: "The chance to begin again—each and every day."),
				Step(time: 69.6, text: "You don’t need to earn gratitude."),
				Step(time: 71.5, text: "You just need to slow down long enough to notice."),
				Step(time: 77.3, text: "Even the hard things—like discomfort, like failure—"),
				Step(time: 80.0, text: "They shape who you are becoming."),
				Step(time: 82.6, text: "They show you how strong you already are."),
				Step(time: 85.8, text: "And they make peace feel that much sweeter when it comes."),
				Step(time: 90.8, text: "Now, gently hold onto this awareness."),
				Step(time: 94.5, text: "Let it settle into you."),
				Step(time: 97.1, text: "Carry it with you."),
				Step(time: 98.0, text: "You’re doing just fine.")
			]
		),
		AudioTrack(
			trackID: 2002,
			trackType: "Mindfulness",
			trackLength: "Normal",
			steps: [
				Step(time: 0.0, text: "Let’s take a moment to pause."),
				Step(time: 4.5, text: "Bring your attention gently to yourself."),
				Step(time: 7.5, text: "Not to your to-do list."),
				Step(time: 10.0, text: "Not to your worries."),
				Step(time: 11.8, text: "Just… you."),
				Step(time: 14.7, text: "Let your thoughts settle, even just a little."),
				Step(time: 19.8, text: "Now ask yourself—"),
				Step(time: 21.9, text: "What is already here… supporting you?"),
				Step(time: 26.1, text: "What quietly holds you together, even when you don’t notice?"),
				Step(time: 32.0, text: "The Stoic philosopher Epictetus once said: “He is a wise man who does not grieve for the things which he has not, but rejoices for those which he has.”"),
				Step(time: 46.0, text: "So now, in your mind, begin to name the small things you’ve been given."),
				Step(time: 52.0, text: "A heart that beats."),
				Step(time: 54.5, text: "A mind that can think, imagine, remember."),
				Step(time: 57.9, text: "Moments of laughter."),
				Step(time: 60.0, text: "People who care about you—even if quietly, from a distance."),
				Step(time: 64.7, text: "The chance to begin again—each and every day."),
				Step(time: 69.6, text: "You don’t need to earn gratitude."),
				Step(time: 71.5, text: "You just need to slow down long enough to notice."),
				Step(time: 77.3, text: "Even the hard things—like discomfort, like failure—"),
				Step(time: 80.0, text: "They shape who you are becoming."),
				Step(time: 82.6, text: "They show you how strong you already are."),
				Step(time: 85.8, text: "And they make peace feel that much sweeter when it comes."),
				Step(time: 90.8, text: "Now, gently hold onto this awareness."),
				Step(time: 94.5, text: "Let it settle into you."),
				Step(time: 97.1, text: "Carry it with you."),
				Step(time: 98.0, text: "You’re doing just fine.")
			]
		)
	]
	
	var mindfulnessExtended = [
		AudioTrack(
			trackID: 2003,
			trackType: "Mindfulness",
			trackLength: "Extended",
			steps: [
				Step(time: 0.0, text: "Let’s take a moment to pause."),
				Step(time: 4.5, text: "Bring your attention gently to yourself."),
				Step(time: 7.5, text: "Not to your to-do list."),
				Step(time: 10.0, text: "Not to your worries."),
				Step(time: 11.8, text: "Just… you."),
				Step(time: 14.7, text: "Let your thoughts settle, even just a little."),
				Step(time: 19.8, text: "Now ask yourself—"),
				Step(time: 21.9, text: "What is already here… supporting you?"),
				Step(time: 26.1, text: "What quietly holds you together, even when you don’t notice?"),
				Step(time: 32.0, text: "The Stoic philosopher Epictetus once said: “He is a wise man who does not grieve for the things which he has not, but rejoices for those which he has.”"),
				Step(time: 46.0, text: "So now, in your mind, begin to name the small things you’ve been given."),
				Step(time: 52.0, text: "A heart that beats."),
				Step(time: 54.5, text: "A mind that can think, imagine, remember."),
				Step(time: 57.9, text: "Moments of laughter."),
				Step(time: 60.0, text: "People who care about you—even if quietly, from a distance."),
				Step(time: 64.7, text: "The chance to begin again—each and every day."),
				Step(time: 69.6, text: "You don’t need to earn gratitude."),
				Step(time: 71.5, text: "You just need to slow down long enough to notice."),
				Step(time: 77.3, text: "Even the hard things—like discomfort, like failure—"),
				Step(time: 80.0, text: "They shape who you are becoming."),
				Step(time: 82.6, text: "They show you how strong you already are."),
				Step(time: 85.8, text: "And they make peace feel that much sweeter when it comes."),
				Step(time: 90.8, text: "Now, gently hold onto this awareness."),
				Step(time: 94.5, text: "Let it settle into you."),
				Step(time: 97.1, text: "Carry it with you."),
				Step(time: 98.0, text: "You’re doing just fine.")
			]
		),
		AudioTrack(
			trackID: 2004,
			trackType: "Mindfulness",
			trackLength: "Extended",
			steps: [
				Step(time: 0.0, text: "Let’s take a moment to pause."),
				Step(time: 4.5, text: "Bring your attention gently to yourself."),
				Step(time: 7.5, text: "Not to your to-do list."),
				Step(time: 10.0, text: "Not to your worries."),
				Step(time: 11.8, text: "Just… you."),
				Step(time: 14.7, text: "Let your thoughts settle, even just a little."),
				Step(time: 19.8, text: "Now ask yourself—"),
				Step(time: 21.9, text: "What is already here… supporting you?"),
				Step(time: 26.1, text: "What quietly holds you together, even when you don’t notice?"),
				Step(time: 32.0, text: "The Stoic philosopher Epictetus once said: “He is a wise man who does not grieve for the things which he has not, but rejoices for those which he has.”"),
				Step(time: 46.0, text: "So now, in your mind, begin to name the small things you’ve been given."),
				Step(time: 52.0, text: "A heart that beats."),
				Step(time: 54.5, text: "A mind that can think, imagine, remember."),
				Step(time: 57.9, text: "Moments of laughter."),
				Step(time: 60.0, text: "People who care about you—even if quietly, from a distance."),
				Step(time: 64.7, text: "The chance to begin again—each and every day."),
				Step(time: 69.6, text: "You don’t need to earn gratitude."),
				Step(time: 71.5, text: "You just need to slow down long enough to notice."),
				Step(time: 77.3, text: "Even the hard things—like discomfort, like failure—"),
				Step(time: 80.0, text: "They shape who you are becoming."),
				Step(time: 82.6, text: "They show you how strong you already are."),
				Step(time: 85.8, text: "And they make peace feel that much sweeter when it comes."),
				Step(time: 90.8, text: "Now, gently hold onto this awareness."),
				Step(time: 94.5, text: "Let it settle into you."),
				Step(time: 97.1, text: "Carry it with you."),
				Step(time: 98.0, text: "You’re doing just fine.")
			]
		)
	]
}

