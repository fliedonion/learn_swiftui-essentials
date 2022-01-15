//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Takahiro Kitahara on 2022/01/14.
//

import SwiftUI

@main
struct LandmarksApp: App {
    //　StateObject - Initialize object only once(during the life time of the app.)
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
