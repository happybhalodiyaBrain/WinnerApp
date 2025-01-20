//
//  ContentView.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//
import Foundation
import SwiftUI

/// The main view that dynamically displays content based on the current navigation route.
struct ContentView: View {
    // MARK: - Properties
       
    /// A shared instance of `NavigationService` to manage navigation state.
    @StateObject private var navigationService = NavigationService.shared
    
    // MARK: - Body
    var body: some View {
        Group {
            // Render views based on the current navigation route.
            switch navigationService.currentRoute {
            case .orderAndReturn :
                OrderandReturn()
            case .notification:
                Notification()
            case .winnerList:
                WinnerList() 
            case .winnerDetails:
                WinnerDetails()
            }
            
        }
        // Pass `navigationService` as an environment object to child views.
        .environmentObject(navigationService)
        .onAppear(){
            deviceScreenSize = UIScreen.main.bounds.size
            
        }
    }
}
