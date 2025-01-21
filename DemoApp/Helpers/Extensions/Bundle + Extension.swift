//
//  Bundle + Extension.swift
//  DemoApp
//
//  Created by Happy  Bhalodiya on 21/01/25.
//

import Foundation
//
//extension Bundle {
//    func decode<T: Decodable>(_ file: String) -> T {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in the bundle.")
//        }
//        
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from the bundle.")
//        }
//        
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .useDefaultKeys // Use default key names
//
//        do {
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Failed to decode \(file) from the bundle: \(error.localizedDescription)")
//        }
//    }
//}
