//
//  CategoryModel.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 22/01/25.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var isSelected: Bool = false
}

struct CarouselItem: Identifiable {
    let id = UUID()
    let imageName: String
}
