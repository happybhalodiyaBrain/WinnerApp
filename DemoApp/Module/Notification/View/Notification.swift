import SwiftUI
/// The main view for displaying notifications and offers in a list format.

struct Notification: View {
    
    // MARK: - State Objects
    
    /// The view model responsible for handling notification data.
    @StateObject private var viewModel = NotificationViewModel()
    
    /// The view model responsible for handling offer notifications data.
    @StateObject private var offerViewModel = OfferNotificationViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack{
            // MARK: Header Section
            CustomHeader(greetingText: Header.notification, onBackTapped: {}, showRightButtons: true, showBackButton : false, cartBadgeCount: 3, isShowingFiler: false)
            Spacer()
            // MARK: Notification and Offer List
            List {
                notificationListSection
                offerListSection
            }
            .listStyle(PlainListStyle())
        }
    }
    
    // MARK: - Notification List Section
    private var notificationListSection: some View {
        ForEach(viewModel.notificationList) { item in
            NotificationCell(item: item)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
        }
    }
    
    // MARK: - Offer List Section
    private var offerListSection: some View {
        ForEach(offerViewModel.sections) { section in
            VStack(spacing: 16) {
                NotificationSectionHeader(date: section.date)
                ForEach(section.offers) { offer in
                    OffersCell(notification: offer)
                }
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        }
    }
}

#Preview {
    Notification()
}
