//
//  quotesCollectionView.swift
//  
//
//  Created by Afga Ghifari on 18/07/25.
//

import SwiftUI

// MARK: - Data Model
// This struct now matches your new JSON structure.
// It's Codable to allow easy decoding from JSON.

struct Quote: Codable, Identifiable {
    let id: String
    let text: String
    let author: String
}

// MARK: - Main View
// This is the primary view that constructs the screen from your screenshot.

struct PhilosopherQuotesView: View {
    // We now load an array of Quote objects from the bundled JSON file.
    let quotes: [Quote] = Bundle.main.decode("quotes.json")
    
    // State for the progress bar
    @State private var collectedQuotes = 17
    private let totalQuotes = 60
    
    // Safely get the author's name from the first quote
    private var authorName: String {
        quotes.first?.author ?? "Philosopher"
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // --- Header Section ---
                    VStack(spacing: 8) {
                        Text("You've Collected")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Text("\(collectedQuotes)/\(totalQuotes)")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        // --- Progress Bar ---
                        ProgressView(value: Double(collectedQuotes), total: Double(totalQuotes))
                            .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)

                    // --- Philosopher Info Section ---
                    HStack {
                        Image(systemName: "person.crop.circle.fill") // Placeholder for philosopher bust
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)

                        VStack(alignment: .leading) {
                            Text(authorName)
                                .font(.title2)
                                .fontWeight(.bold)
                            Text("\(quotes.count) / 10") // Example progress
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Button("More >") {
                            // Action for the "More" button
                            print("More button tapped for \(authorName)")
                        }
                        .foregroundColor(.accentColor)
                    }
                    .padding(.horizontal)

                    // --- Quotes Carousel ---
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(quotes) { quote in
                                QuoteCardView(quote: quote)
                            }
                        }
                        .padding(.horizontal)
                    }
                    // This makes the scroll view snap to the beginning of each card
                    .scrollTargetBehavior(.viewAligned)
                }
                .padding(.vertical)
            }
            .navigationTitle("Philosopher Quotes")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                // Action for back button
            }) {
                Image(systemName: "chevron.left")
                Text("Back")
            })
            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all)) // A dark-mode friendly background
        }
    }
}


// MARK: - Quote Card View
// A reusable view for displaying a single quote in the carousel.

struct QuoteCardView: View {
    let quote: Quote

    var body: some View {
        VStack {
            Spacer()
            
            Text("\"\(quote.text)\"")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            Text(quote.id) // Displaying the string ID
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom)
        }
        .frame(width: 280, height: 320)
        .background(Color.black)
        .foregroundColor(.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}


// MARK: - JSON Decoding Helper
// An extension on Bundle to make loading and decoding JSON safer and cleaner.

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
