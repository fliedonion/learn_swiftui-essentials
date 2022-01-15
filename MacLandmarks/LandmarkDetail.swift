//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by Takahiro Kitahara on 2022/01/16.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData // favorite ボタンから必要に。
    var landmark: Landmark
    
    var landmarkIndex: Int {
        // StateObject（modelData）の初期化が１回だからインデックスアクセスでも問題ないのだと思う。
        // idではなくてindexが欲しいのでこのプロパティがある。
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    
    var body: some View {
            ScrollView {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    MapView(coordinate: landmark.locationCoordinate)
                        .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                    
                    Button("Open in Maps") {
                        let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                        destination.name = landmark.name
                        destination.openInMaps()
                    }
                    .padding()
                }

                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 24) {
                        CircleImage(image: landmark.image.resizable())
                            .frame(width: 160, height: 160)

                        VStack(alignment: .leading) {
                            HStack {
                                Text(landmark.name)
                                    .font(.title)
                                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                    .buttonStyle(.plain)
                            }

                            VStack(alignment: .leading) {
                                Text(landmark.park)
                                Text(landmark.state)
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                    }

                    Divider()

                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
                .frame(maxWidth: 700)
                .offset(y: -50)
            }
            .navigationTitle(landmark.name)         // listとかからnavigationしてきた時に意味をなす
        // .navigationBarTitleDisplayMode(.inline) // remove for MacApp
        
            
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[3])
            .environmentObject(modelData)
    }
}
