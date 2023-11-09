//
//  CustomButtonView.swift
//  Hike App
//
//  Created by Andima Udoh on 25/10/2023.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    .linearGradient(colors: [
                        .white, .customGreenLight, .customGreenLMedium
                    ], startPoint: .top, endPoint: .bottom)
                )
            Circle()
                .stroke(LinearGradient(colors: [.customGrayLight, .customGrayLMedium], startPoint: .top, endPoint: .bottom), lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [.customGrayLight, .customGrayLMedium], startPoint: .top, endPoint: .bottom)
                )
        }//: ZSTACK
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}
