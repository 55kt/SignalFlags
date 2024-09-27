//
//  SignalFlag.swift
//  SignalFlag
//
//  Created by Vlad on 27/9/24.
//

import Foundation

struct SignalFlag: Decodable, Identifiable {
    let id: Int
    let symbol: String
    let name: String
    let description: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
}
