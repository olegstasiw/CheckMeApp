//
//  ContentView.swift
//  CheckMeApp
//
//  Created by mac on 03.08.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var currentValue = 50.0
    @State private var targetValue = Double.random(in: 0...100)
    @State private var alert = false

    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к:")
                Text("\(lround(targetValue))")
            }
            .padding()

            HStack {
                Text("1")
                UICheckSlider(sliderValue: $currentValue, targetValue: $targetValue)
                Text("100")
            }
            .padding()

            Button(action: { self.alert = true }) {
                Text("Проверь меня!")
            }
            .padding()
            .alert(isPresented: $alert) { () -> Alert in
                Alert(title: Text("Привет"), message: Text("Твой результат: \(computeScore())"))
            }

            Button(action: { self.targetValue = Double.random(in: 0...100) }) {
                Text("Начать заново!")
            }
            .padding()
        }
    }

}

extension ContentView {
    private func computeScore() -> Int {
      let difference = abs(Int(targetValue) - lround(currentValue))
        return 100 - difference
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
