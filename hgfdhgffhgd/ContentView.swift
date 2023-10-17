//
//  ContentView.swift
//  hgfdhgffhgd
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    let constants: [String] = ["😀","😎","🥺","😡"]
    @State var cards: [String] = []
    @State var dzialaPlus : Bool = false
    @State var dzialaMinus : Bool = true
    @State var indexEmoji : Int = 0
    
    private let columns = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120)),

    ]
    
    var body: some View {
        VStack {
           cardDisplay()
          
        }
        
        HStack{
add()
            Spacer()
remove()
        }
        
        .padding()
    }
    
    
    
    func cardDisplay() -> some View{
        LazyVGrid(columns: columns){
      
                ForEach(cards, id: \.self){card in
                  CardView(emoji: card)
                }
            
            
        }.foregroundColor(.blue)
    }
    
    func add() -> some View{
        Button("Add", action: {adjustCardNumber(by: 1, symbol: constants[indexEmoji])}).disabled(dzialaPlus)
    }
func remove() -> some View{
    Button("Remove", action: {adjustCardNumber(by: -1)}).disabled(dzialaMinus)
}
    
    
    func adjustCardNumber(by offset: Int, symbol: String = ""){
        if(offset == 1){
            cards.append(symbol)
            indexEmoji = indexEmoji + 1
            dzialaMinus = false
            if(indexEmoji == 4){
                self.dzialaPlus = true
            }
        } else if(offset == -1) {
            cards.removeLast()
            dzialaPlus = false
            indexEmoji = indexEmoji - 1
            if(indexEmoji == 0){
                self.dzialaMinus = true
            }
        }
       
    }
    
    func removeCard(by offset: Int){
        cards.removeLast()
    }
    
    
}

#Preview {
    ContentView()
}
