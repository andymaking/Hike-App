//
//  CardView.swift
//  Hike App
//
//  Created by Andima Udoh on 24/10/2023.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    @State private var isShowingSheet : Bool = false
    
    
    //MARK: - FUNCTIONS
    func randomImage (){
        
        print("--- THE BUTTON WAS PRESSED ---")
        print("Status: Old image number = \(imageNumber)")
        
        repeat{
            randomNumber = Int.random(in: 1...5)
            print("Random number generated = \(randomNumber)")
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        print("New Image number = \(imageNumber)")
        print("--- THE END ---\n")
    }
    
    var body: some View {
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight, .customGrayLMedium], startPoint: .top, endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            // ACTION: Show a sheet
                            withAnimation {
                                isShowingSheet.toggle()
                            }
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    Text("Fun and enjoyable out door activities for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayLMedium)
                }//: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button(action: {
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight, .customGreenLMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.23), radius: 0.25, x: 1, y: 2)
                })
                .buttonStyle(GradientButton())
            }//: VSTACK
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
