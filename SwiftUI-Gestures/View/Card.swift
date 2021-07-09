//
//  Card.swift
//  SwiftUI-Gestures
//
//  Created by Arpit Dixit on 09/07/21.
//

import SwiftUI

struct Card: View {
    let tapped: Bool
    @State var magnificationScale: CGFloat = 1
    var body: some View {
        VStack {
            Image("model")
                .resizable()
                .scaleEffect(magnificationScale)
                .aspectRatio(contentMode: .fit)
                .gesture(MagnificationGesture()
                            .onChanged({ (scale) in
                                magnificationScale = scale
                            })
                            .onEnded({_ in 
                                magnificationScale = 1
                            })
                )
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: UIScreen.main.bounds.width - 40, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(tapped ? Color.purple : Color.orange)
        .cornerRadius(30)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: false)
    }
}
