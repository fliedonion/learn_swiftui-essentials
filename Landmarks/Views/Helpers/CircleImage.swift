//
//  CircleImage.swift
//  Landmarks
//
//  Created by Takahiro Kitahara on 2022/01/15.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        if #available(macOS 12.0, *) {
            image
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(alignment: .top) {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7)
        } else {
            image
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(radius: 7)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
