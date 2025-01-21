//
//  MapAnnotation.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 21/01/25.
//

import SwiftUI

struct MapAnnotationView: View {
    
   
    @State private var animation : Double = 0.0
    var body: some View {
        ZStack{
            Image(Icons.ic_locationPin.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 37, height: 47)
        }
    }
}

#Preview {
    MapAnnotationView()
}
