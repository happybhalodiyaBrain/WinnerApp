//
//  WinnerListViewModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

// MARK: - WinnersViewModel

/// A ViewModel class responsible for managing the list of winners.
class WinnersViewModel: ObservableObject {
    
    /// An array of `WinnerListData` objects representing the winners.
    @Published var winnersList: [WinnerListData] = [
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
        WinnerListData(
            imageName: "placeholder_image",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            date: "23 July 2023"
        ),
    ]
}
