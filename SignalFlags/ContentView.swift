//
//  ContentView.swift
//  SignalFlags
//
//  Created by Vlad on 27/9/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var searchText: String = ""
    let flags = Flags()
    
    // Search variable
    var searchFlags: [SignalFlag] {
        return flags.search(for: searchText)
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(searchFlags) { flag in
                NavigationLink {
                    FlagDetail()
                } label: {
                    HStack {
                        
                        // Flag Image
                        Image(flag.image)
                            .cornerRadius(6)
                            .shadow(color: .black.opacity(0.2), radius: 4, x: 2, y: 2)
                        
                        Spacer()
                        
                        VStack {
                            
                            // Flag Symbol
                            Text(flag.symbol)
                            
                            // Flag Name
                            Text(flag.name)
                            
                        }
                        
                    }
                }
            }
            .navigationTitle("Signal Flags")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
