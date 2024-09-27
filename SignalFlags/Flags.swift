//
//  Flags.swift
//  SignalFlags
//
//  Created by Vlad on 27/9/24.
//

import Foundation

class Flags {
    
    // MARK: - Properties
    var signalFlags: [SignalFlag] = []
    
    // MARK: - Initializer
    init() {
        decodeSignalFlags()
    }
    
    // MARK: - Methods
    
    // Function to decode the JSON data to Swift
    func decodeSignalFlags() {
        if let url = Bundle.main.url(forResource: "imsf", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                signalFlags = try decoder.decode([SignalFlag].self, from: data)
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    // Function for enable toolbar search
    func search(for searchTerm: String) -> [SignalFlag] {
        if searchTerm.isEmpty {
            return signalFlags
        } else {
            return signalFlags.filter { flag in
                flag.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
}
