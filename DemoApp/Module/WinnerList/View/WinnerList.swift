
import SwiftUI


// MARK: - WinnerList View
/// A SwiftUI view that displays a list of winners.
struct WinnerList: View {
    
    // MARK: - Properties
    /// The view model that manages the winners' data.
    @StateObject private var viewModel = WinnersViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack{
            
            // MARK: - Custom Header
            CustomHeader(
                greetingText: Header.winnerList, onBackTapped: {}, showRightButtons: false, showBackButton : false, cartBadgeCount: 2, isShowingFiler: false)
            
            // MARK: - Winners List
            /// A list displaying all winners using the data from the view model.
            List(viewModel.winnersList) { winner in
                VStack {
                    WinnerRowView(winner: winner)
                    Divider()
                        .padding([.top ,.bottom], 4)
                }
                .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    WinnerList()
}
