//
//  PannelView.swift
//  National Geographic
//
//  Created by Soha Ahmed Hamdy on 08/08/2035.
//

import SwiftUI

struct PannelView: View {
    
    @State var isPannelOpened : Bool = false
    var scale : CGFloat
    var offset : CGSize
    
    var body: some View {
        HStack{
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture (minimumDuration: 1){
                    withAnimation(.spring()){
                        isPannelOpened.toggle()
                    }
                }
            
            HStack{
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                    .padding(.vertical, 7)
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                    .padding(.vertical, 7)
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                    .padding(.vertical, 7)
                Spacer()
                
            }// inner HStack
            .background(.ultraThinMaterial)
            .font(.footnote)
            .frame(maxWidth: 420, minHeight: 30, alignment: .center)
            .opacity(isPannelOpened ? 1 : 0)
        }//outter HStack
        .padding(8)
    }
}

struct PannelView_Previews: PreviewProvider {
    static var previews: some View {
        PannelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
    }
}
