//
//  ControlView.swift
//  National Geographic
//
//  Created by Soha Ahmed Hamdy on 08/08/2035.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var imageScale : CGFloat
    @Binding var imageOffset : CGSize
    
    func resetImage(){
        imageScale = 1
        imageOffset = .zero
    }
    
    var body: some View {
        HStack{
            Button(action: {
                if imageScale > 1 {
                    imageScale = imageScale - 1
                }
            }) {
                Image(systemName: "minus.magnifyingglass")
            }
            
            Button(action: {
                resetImage()
            }) {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            
            Button(action: {
                if imageScale < 3 {
                    imageScale = imageScale + 1
                }
            }) {
                Image(systemName: "plus.magnifyingglass")
            }
        }// HStack
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(.thinMaterial)
        .font(.largeTitle)
        .cornerRadius(30)
        
        
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(imageScale: .constant(1), imageOffset: .constant(.zero)).preferredColorScheme(.dark)
    }
}
