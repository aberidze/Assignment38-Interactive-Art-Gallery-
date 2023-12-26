//
//  ContentView.swift
//  InteractiveArtGallery
//
//  Created by Macbook Air 13 on 23.12.23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State var randomImageNames = [
        "GirlWithAPearlEarring",
        "TheLastSupper",
        "TheStarryNight"
    ]
    @State var initialImageName = "GirlWithAPearlEarring"
    @State var imageOffset = CGSize.zero
    @State var degreesRotated = 0.0
    @State var scaledBy = 1.0
    
    
    // MARK: - body
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 16) {
                    
                    CustomImageView(imageName: initialImageName)
                        .onTapGesture {
                            initialImageName = randomImageNames.randomElement() ?? ""
                        }
                    
                    CustomImageView(imageName: "MonaLisa")
                        .offset(imageOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { imageOffset = $0.translation }
                        )
                    
                    CustomImageView(imageName: "TheBirthOfVenus")
                        .onLongPressGesture(minimumDuration: 2.5, maximumDistance: 150) {
                            print("Ouch")
                        }
                    
                    CustomImageView(imageName: "TheCreationOfAdam")
                        .rotationEffect(Angle(degrees: degreesRotated))
                        .gesture(
                            RotationGesture()
                                .onChanged({ degreesRotated = $0.degrees
                                })
                        )
                    
                    CustomImageView(imageName: "TheKiss")
                        .scaleEffect(scaledBy)
                        .gesture(
                            MagnificationGesture()
                                .onChanged({ scaledBy = $0.magnitude
                                })
                        )
                    
                    Spacer(minLength: 100)
                    
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .navigationTitle("Interactive Art Gallery")
        }
    }
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
