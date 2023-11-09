//
//  MotionAnimationView.swift
//  Hike App
//
//  Created by Andima Udoh on 31/10/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - PROPERTIES
    @State private var randomInt : Int = Int.random(in: 6...12)
    @State private var isAnimate : Bool = false
    
    //MARK: - FUNCTIONS
    
    //1. RANDOM COORDINATE
    
    func randomCoordinate () -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
 
    //2. RANDOM SIZE
    
    func randomSize () -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    //3. RANDOM SCALE
    
    func randomScale () -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. RANDOM SPEED
    
    func randomSpeed () -> Double {
        return Double.random(in: 0...2)
    }
    
    //5. RANDOM DELAY
    func randomDelay () -> Double {
        return Double.random(in: 0.05...1.0)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomInt, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.24)
                    .frame(width: randomSize())
                    .scaleEffect(isAnimate ? randomScale() : 1)
                    .position(
                        x: randomCoordinate(),
                        y: randomCoordinate()
                    )
                    .onAppear(perform: {
                        withAnimation (
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimate = true;
                        }
                    })
            }
        }//: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    ZStack {
        Color.teal.ignoresSafeArea()
        MotionAnimationView()
    }
}
