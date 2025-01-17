//
//  WinnerListData.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

/// A model representing the details of a winner.
struct WinnerListData : Identifiable {
    /// Unique identifier for each winner data
    let id = UUID()
    /// The name of the image associated with the winner
    let imageName: String
    /// A description of the winner or competition
    let description: String
    /// The date when the winner was announced
    let date: String
}
