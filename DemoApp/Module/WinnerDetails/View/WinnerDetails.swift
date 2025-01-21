//
//  WinnerDetails.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import SwiftUI

struct WinnerDetails: View {
    var body: some View {
        VStack{
            CustomHeader(
                greetingText: Header.winnerDetails, onBackTapped: {}, showRightButtons: false, showBackButton : false, cartBadgeCount: 3, isShowingFiler: false)
            Spacer()
        }
    }
}

#Preview {
    WinnerDetails()
}
