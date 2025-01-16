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
            HStack(spacing: 16) {
                Image(winner.imageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(winner.description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    Text(winner.date)
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.vertical, 8)
        }
}


