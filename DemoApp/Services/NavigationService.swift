//
//  NavigationService.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 16/01/25.
//

import Foundation

/// A service to manage navigation paths and state within the application.
class NavigationService: ObservableObject {
    
    // MARK: - Singleton Instance
    
    /// The shared instance of `NavigationService`.
    static let shared = NavigationService()
    
    // MARK: - Initialization
    
    /// Private initializer to enforce singleton usage.
    private init() { }
    
    // MARK: - Properties
    
    /// The navigation path stack, holding the sequence of routes
    @Published var navigationPath: [AppRoutes] = []
    
    /// The current route based on the top of the navigation stack.
    
    var currentRoute: AppRoutes {
        navigationPath.last ?? .mapView
    }
    
    // MARK: - Navigation Methods
    
    /// Pushes a new route onto the navigation stack.
    /// - Parameter route: The route to navigate to.
    func push(to route: AppRoutes) {
        navigationPath.append(route)
    }
    
    /// Pops the navigation stack to a specific route or one step back if no route is specified.
    /// - Parameter route: The route to pop to. If `nil`, pops the last route.
    func pop(to route: AppRoutes? = nil) {
        if let route {
            guard let index = navigationPath.firstIndex(of: route) else { return }
            navigationPath = Array(navigationPath[0...index])
        } else {
            guard !navigationPath.isEmpty else { return }
            navigationPath.removeLast()
        }
    }
    
    /// Pops a specified number of steps from the navigation stack.
    /// - Parameter step: The number of steps to pop.
    func pop(to step: Int) {
        guard navigationPath.count > step else { return }
        navigationPath.removeLast(step)
    }
    
    /// Clears the navigation stack and optionally pushes a new route.
    /// - Parameter route: The route to push after clearing the stack. Defaults to `nil`.
    func popToRoot(push route: AppRoutes? = nil) {
        navigationPath.removeAll()
        if let route {
            push(to: route)
        }
    }
}
