//
//  CardView.swift
//  hgfdhgffhgd
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    @State var show : Bool = true
    @State var emoji: String = "😛"
    @State var opacity : Double = 0.0
  
    var body: some View {
            ZStack{
                Text(emoji)
                RoundedRectangle(cornerRadius: 12.0).fill(Color.blue).opacity(opacity).border(Color.blue, width: 2).cornerRadius(12.0)
                
            }
            .onTapGesture {
                
                reverseCard()
        }
    }
    

    func reverseCard() {
        if(show){
            opacity = 1.0
        } else {
            opacity = 0.0
        }
        show = !show
    }
}

#Preview {
    CardView()
}
