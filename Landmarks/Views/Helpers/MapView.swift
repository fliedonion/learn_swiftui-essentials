//
//  MapView.swift
//  Landmarks
//
//  Created by Takahiro Kitahara on 2022/01/15.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate : CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion() // to empty
   
    // we can't do that. これだと（多分 ＠State だと最初から必要だから）インスタンス生成前にプロパティにアクセスしようとしてしまうので、
    // 表示後にcoordinate使うように仕向けないといけない。
    //    @State private var region = MKCoordinateRegion(
    //        center: coordinate,
    //        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    //    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear{
                setRegion(coordinate)
            }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
