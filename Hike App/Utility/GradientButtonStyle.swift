//
//  GradientButtonStyle.swift
//  Hike App
//
//  Created by Andima Udoh on 28/10/2023.
//

import Foundation
import SwiftUI

struct GradientButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                LinearGradient(
                    colors: [.customGrayLight.opacity(0.5), .customGrayLMedium.opacity(0.5)],
                    startPoint: .top,
                    endPoint: .bottom
                )
                :
                LinearGradient(
                    colors: [.customGrayLight, .customGrayLMedium],
                    startPoint: .top,
                    endPoint: .bottom
                )
                
            )
            .cornerRadius(40)
    }
}
