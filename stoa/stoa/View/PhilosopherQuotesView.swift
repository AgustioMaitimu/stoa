//
//  quotesCollectionView.swift
//
//
//  Created by Afga Ghifari on 18/07/25.
//

import SwiftUI

struct Quote: Codable, Identifiable {
	let id: String
	let text: String
	let meaning: String
}

struct Philosopher: Codable, Identifiable {
	let id: Int
	let name: String
	let quotes: [Quote]
	let imageName: String
}

struct PhilosopherQuotesView: View {
	let philosophers: [Philosopher] = Bundle.main.decode("quotes.json")
	
	@State private var collectedQuotes = 20
	private let totalQuotes = 60
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: 24) {
				// --- Header Section ---
				VStack(spacing: 8) {
					Text("You've Collected")
						.font(.headline)
						.foregroundColor(.secondary)
					
					Text("\(collectedQuotes)/\(totalQuotes)")
						.font(.subheadline)
						.foregroundColor(.stoaGold)
					
					// --- Progress Bar ---
					ProgressBar(
						progress: Double(collectedQuotes) / Double(totalQuotes)
					)
					.padding(.horizontal)
				}
				.frame(maxWidth: .infinity)
				.padding(.bottom)
				
				// --- Loop through each philosopher ---
				ForEach(philosophers) { philosopher in
					PhilosopherSectionView(philosopher: philosopher)
				}
				
				Text("Stay updated for more quotes!")
					.font(.caption)
					.frame(maxWidth: .infinity, alignment: .center)
					.padding(.top)
			}
			.padding(.vertical)
		}
		.navigationTitle("Philosopher Quotes")
		.navigationBarTitleDisplayMode(.inline)
		.background(Color(.stoaDarkBlue).edgesIgnoringSafeArea(.all))
	}
	
}

struct ProgressBar: View {
	/// 0.0 … 1.0
	var progress: Double
	/// Track’s full pill height
	var trackHeight: CGFloat = 16
	/// Fill’s inner bar height
	var fillHeight: CGFloat = 8
	var trackColor: Color = .white
	var fillColor: Color = .stoaGold
	
	var body: some View {
		GeometryReader { proxy in
			let width = proxy.size.width
			ZStack {
				Capsule()
					.fill(trackColor)
					.frame(height: trackHeight)
				
				VStack {
					Spacer()
					HStack(spacing: 0) {
						Capsule()
							.fill(fillColor)
							.frame(
								width: width * min(max(progress, 0), 1),
								height: fillHeight
							)
							.padding(.leading)
						Spacer(minLength: 0)
					}
					Spacer()
				}
			}
		}
		.frame(height: trackHeight)
	}
}

struct PhilosopherSectionView: View {
	let philosopher: Philosopher
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			// --- Philosopher Info Section ---
			HStack {
				Image(philosopher.imageName)
					.resizable()
					.frame(width: 50, height: 50)
					.foregroundColor(.gray)
				
				VStack(alignment: .leading) {
					Text(philosopher.name)
						.font(.title2)
						.fontWeight(.bold)
					Text("\(philosopher.quotes.count) / 10")
						.font(.subheadline)
						.foregroundColor(.stoaGold)
				}
				
				Spacer()
				
				Button(action: {
					print("More button tapped for \(philosopher.name)")
				}) {
					Text("More")
					Image(systemName: "chevron.right")
				}
				.foregroundColor(.accentColor)
			}
			.padding(.horizontal)
			
			// --- Quotes Carousel ---
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 16) {
					ForEach(philosopher.quotes) { quote in
						QuoteCardView(quote: quote)
					}
				}
				.padding(.horizontal)
			}
			.scrollTargetBehavior(.viewAligned)
		}
	}
}

import SwiftUI

struct QuoteCardView: View {
	let quote: Quote
	@State private var showingMeaning = false
	
	var body: some View {
		VStack {
			Spacer()
			
			Text(showingMeaning ? quote.meaning : "“\(quote.text)”")
				.font(.body)
				.multilineTextAlignment(.center)
				.foregroundColor(showingMeaning ? .black : .white)
				.padding()
			
			Spacer()
			
			Text(showingMeaning ? "Meaning" : quote.id)
				.font(.caption)
				.foregroundColor(showingMeaning ? .black.opacity(0.6) : .secondary)
				.padding(.bottom)
		}
		.frame(width: 300, height: 360)
		.background(showingMeaning ? Color.white : Color.black)
		.cornerRadius(20)
		.shadow(radius: 5)
		.onTapGesture {
			withAnimation(.easeInOut) {
				showingMeaning.toggle()
			}
		}
	}
}



// MARK: - JSON Decoding Helper
extension Bundle {
	func decode<T: Decodable>(_ file: String) -> T {
		guard let url = self.url(forResource: file, withExtension: nil) else {
			fatalError("Failed to locate \(file) in bundle.")
		}
		
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Failed to load \(file) from bundle.")
		}
		
		let decoder = JSONDecoder()
		
		guard let loaded = try? decoder.decode(T.self, from: data) else {
			fatalError("Failed to decode \(file) from bundle.")
		}
		
		return loaded
	}
}


// MARK: - SwiftUI Preview
struct PhilosopherQuotesView_Previews: PreviewProvider {
	static var previews: some View {
		PhilosopherQuotesView()
			.preferredColorScheme(.dark)
	}
}
