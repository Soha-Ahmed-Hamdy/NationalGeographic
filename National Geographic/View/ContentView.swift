//
//  ContentView.swift
//  National Geographic
//
//  Created by Soha Ahmed Hamdy on 26/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var scaleEffect : CGFloat = 1
    @State var imageOffset : CGSize = .zero
    @State var index : Int = 0
    var imagesCover : [Images] = imageData
    
    private func resetImage (){
        scaleEffect = 1
        imageOffset = .zero
    }
    
    var body: some View {
        Image("cover\(index+1)")
            .resizable()
            .scaledToFit()
            .cornerRadius(20)
            .padding()
            .scaleEffect(scaleEffect)
            .offset(x: imageOffset.width , y : imageOffset.height)
            .shadow(color: .black.opacity(0.8), radius: 8, x: 5, y: 5)
            .overlay(alignment: .topTrailing ){
                Drawer(index: $index, imageScale: $scaleEffect, imageOffset: $imageOffset)
                    .padding(.top, 15)
            }
            .overlay(alignment: .bottom ){
                ControlView(imageScale: $scaleEffect, imageOffset: $imageOffset)
            }
            .overlay(alignment: .top ){
                PannelView(scale: scaleEffect, offset: imageOffset)
                    .padding()
                    .offset(y: -50)
            }
        
            //MARK: - double tap gesture
            .onTapGesture(count: 2) {
                withAnimation(.spring()){
                    if scaleEffect == 1{
                        scaleEffect = 3
                    }else{
                        resetImage()
                    }
                }
                
            }// double tap gesture
        
            //MARK: - drag gesture
            .gesture(DragGesture()
                .onChanged({ gesture in
                    imageOffset = gesture.translation
                })
                .onEnded({ gesture in
                    if scaleEffect <= 1{
                        withAnimation(.spring()){
                            resetImage()
                        }
                    }
                })
                    
            )// drag gesture
        
            //MARK: - magnification gesture
            .gesture(MagnificationGesture()
                .onChanged({ gesture in
                    withAnimation(.spring()){
                        if scaleEffect <= 3 && scaleEffect >= 1{
                            scaleEffect = gesture
                        }else if scaleEffect > 3{
                            scaleEffect = 3
                        }else if scaleEffect < 1{
                            scaleEffect = 1
                        }
                    }// end of animation
                })
                .onEnded({ gesture in
                    withAnimation {
                        if gesture > 3{
                            scaleEffect = 3
                        }else if gesture < 1{
                            scaleEffect = 1
                        }else{
                            scaleEffect = gesture
                        }
                    }
                })
            
            )
        
    }// Body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
