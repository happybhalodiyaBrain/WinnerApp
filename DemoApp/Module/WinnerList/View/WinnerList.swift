
import SwiftUI

struct WinnerList: View {
    @StateObject private var viewModel = WinnersViewModel()

    var body: some View {
        VStack{
            CustomHeader(
                greetingText: Header.winnerList, onBackTapped: {})
            
            List(viewModel.winnersList) { winner in
                            WinnerRowView(winner: winner)
                        }
                        .listStyle(PlainListStyle())
           
            Spacer()
        }
    }
}

#Preview {
    WinnerList()
}
