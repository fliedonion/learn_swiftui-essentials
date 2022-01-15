//
//  ContentView.swift
//  Landmarks
//
//  Created by Takahiro Kitahara on 2022/01/14.
//

import SwiftUI

// section1 finished.

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone 13 Pro Max")
        }
        .environmentObject(ModelData()) // environmentObjectを渡すのは実行時は LandmarksApp（というかこのオブジェクトを使うところ）でやってる。離れていてViewでもないので見落としやすい。

    }
}
