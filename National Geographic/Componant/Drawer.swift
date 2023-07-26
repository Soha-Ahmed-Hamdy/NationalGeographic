//
//  Drawer.swift
//  National Geographic
//
//  Created by Soha Ahmed Hamdy on 08/08/2035.
//

import SwiftUI

struct Drawer: View {
    let images = imageData
    @State var isDrawerOpened : Bool = false
    @Binding var index : Int
    @Binding var imageScale : CGFloat
    @Binding var imageOffset : CGSize
    
    var body: some View {
        HStack{
            Image(systemName: isDrawerOpened ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .center)
                .padding(.leading, 2)
                .foregroundColor(.secondary)
                .onTapGesture {
                    withAnimation(.spring()){
                        isDrawerOpened.toggle()
                    }
                }
            
            
            ForEach(images){ item in
                Image(item.thum)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120, alignment: .center)
                    .padding(.horizontal, 2)
                    .onTapGesture {
                        withAnimation(.spring()){
                            index = item.id
                            isDrawerOpened.toggle()
                            imageScale = 1
                            imageOffset = .zero
                        }
                    }
            }
        }
        .padding(.horizontal, 4)
        .frame(width: 300)
        .background(.thinMaterial)
        .cornerRadius(10)
        .offset(x: isDrawerOpened ? 0 : 272)
    }
}

struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        Drawer(index: .constant(0), imageScale: .constant(1), imageOffset: .constant(.zero) )
    }
}
