//
//  Notification.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 17/01/25.
//

import SwiftUI

struct Notification: View {
    @StateObject private var viewModel = NotificationViewModel()
    @StateObject private var offerViewModel = OfferNotificationViewModel()
    var body: some View {
        VStack{
            CustomHeader(greetingText: "Notification", onBackTapped: {}, showRightButtons: true, showBackButton : false, cartBadgeCount: 3)
            Spacer()
            
            List() {
                ForEach(viewModel.notificationList) { item in
                    VStack{
                        NotificationCell(item: item)
                    }.listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
                }
                
                ForEach(offerViewModel.sections) { section in
                    VStack(spacing: 16){
                        NotificationSectionHeader(date: section.date)
                        ForEach(section.offers) { offer in
                            OffersCell(notification: offer)
                        }
                    }.listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                    
                    
                }
            }.listStyle(PlainListStyle())
        }
    }
}

#Preview {
    Notification()
}
