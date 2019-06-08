/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Helpers for loading images and data.
*/

import UIKit
// import SwiftUI
// import CoreLocation

let landmarkData: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    /*
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    */
    let file = URL(fileURLWithPath: "LandmarkTutorial3Complete/Landmarks/Landmarks/Resources/" + filename)
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    static let shared = ImageStore()
    func image(name: String, size: Int) -> Image {
        return Image(url: name + ".jpg", label: Text(verbatim: name))
    }
}

