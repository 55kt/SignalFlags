//
//  ContentView.swift
//  SignalFlags
//
//  Created by Vlad on 27/9/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let flags = Flags()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(flags.signalFlags) { flag in
                NavigationLink {
                    FlagDetail()
                } label: {
                    HStack {
                        
                        // Flag Image
                        Image(flag.image)
                        
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
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
