//
//  WinnerRowView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import SwiftUI

struct WinnerRowView: View {
    let winner: WinnerListData
        
        var body: some View {
            
            HStack {
                Image(Icons.dummy.rawValue)
                    .resizable()
                    .frame(width: 102, height: 58)
                    .cornerRadius(4)
                
                VStack(alignment: .leading, spacing: 11) {
                    Text(winner.description)
                        .listTextStyle()
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(winner.date)
                        .smallTextStyle()
                }.padding(.leading, 12)
                    .padding(.trailing, 16)
                Spacer()
            }
    
            
            
                
        }
}

#Preview {
    WinnerRowView(winner:WinnerListData(
        imageName: "placeholder_image",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        date: "23 July 2023"
    ))
}
