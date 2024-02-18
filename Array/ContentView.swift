//
//  ContentView.swift
//  Array
//
//  Created by Berk Gozek on 12/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var suits : [String] = ["♠️","♣️","♥️","♦️"]
    @State var pips : [String] = ["1","2","3","4","5","6","7","8","9","10","J","Q","K"]
    @State var currentCard = "000"
    @State var cardShown : String = "♠️1"
    var body: some View {
        VStack {
            Text(cardShown).font(.largeTitle)
            Button("Next Card"){
                nextCard()
            }.buttonStyle(.bordered)
            Button("Random Card"){
                randomCard()
            }.buttonStyle(.bordered)
        }
        .padding()
    }
    
    func nextCard(){
        var cur = Int(currentCard) ?? 0
        cur += 1;
        
        if (cur / 100 > 3){
            cur = cur-400
        }
        if (cur % 100 > 12){
            cur = cur - (cur % 100) + 100
        }
        currentCard = cur >= 400 ? "000" : (cur / 100 == 0 ? ( cur/10 == 0 ? "00" : "0") + String(cur) : String(cur))
        updateCard()
        
    }
    func sliceString(t:String , s:Int , e: Int) -> String {
            let startIndex = t.index(t.startIndex, offsetBy: s)
            let endIndex = t.index(t.startIndex, offsetBy: e)
            return String(t[startIndex...endIndex])
        }
    func updateCard(){
        cardShown = suits[Int(sliceString(t: currentCard, s: 0, e: 0)) ?? 0] + pips[Int(sliceString(t: currentCard, s: 1, e: 2)) ?? 0]
    }
    func randomCard(){
        var suit = Int.random(in: 0...3)
        var pip = Int.random(in: 0...12)
        cardShown = suits[suit]+pips[pip]
        currentCard = String(suit) + (pip < 10 ? ("0") : "")+String(pip)
        
    }
    
}

#Preview {
    ContentView()
}
