//
//  ContentView.swift
//  SwiftUI-Gestures
//
//  Created by Arpit Dixit on 09/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var tapped: Bool = false
    @State var dragState: CGSize = CGSize.zero
    @State var rotationState: Double = 0.0
    
    var body: some View {
        Card(tapped: tapped)
            .animation(.spring(response: 0.6, dampingFraction: 0.5))
            .rotationEffect(Angle(degrees: rotationState))
            .offset(y: dragState.height)
            .gesture(RotationGesture()
                        .onChanged({ (value) in
                            rotationState = value.degrees
                        })
            )
            .gesture(DragGesture()
                        .onChanged({ (value) in
                            dragState = value.translation
                        })
                        .onEnded({ (value) in
                            dragState = CGSize.zero
                        })
            )
            .gesture(TapGesture(count: 1)
                        .onEnded({ () in
                            tapped.toggle()
                        })
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
