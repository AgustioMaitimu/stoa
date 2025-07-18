//
//  stoaApp.swift
//  stoa
//
//  Created by Agustio Maitimu on 15/07/25.
//

import SwiftUI

@main
struct stoaApp: App {
    var body: some Scene {
        WindowGroup {
			ContentViewDraft()
        }
		.modelContainer(for: SavedSession.self)
    }
}
