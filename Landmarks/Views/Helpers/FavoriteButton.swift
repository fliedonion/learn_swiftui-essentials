//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Takahiro Kitahara on 2022/01/15.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage:isSet ? "star.fill" : "star" )
                .labelStyle(.iconOnly) // タイトル文字を見せないけど、VoiceOverが認識できるのでタイトル文字を入れるのは無意味ではない。
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        // FavoriteButton(isSet: false) // エラー
        FavoriteButton(isSet: .constant(true)) // バインドできる型にする（.constantは -> Binding<T>を返す）。
    }
}
