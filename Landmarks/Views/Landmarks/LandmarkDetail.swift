//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Takahiro Kitahara on 2022/01/15.
//

import SwiftUI

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
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(landmark.name)         // listとかからnavigationしてきた時に意味をなす
        .navigationBarTitleDisplayMode(.inline) // listとかからnavigationしてきた時に意味をなす
        
            
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[3])
            .environmentObject(modelData)
    }
}
