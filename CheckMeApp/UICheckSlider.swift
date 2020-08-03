//
//  UICheckSlider.swift
//  CheckMeApp
//
//  Created by mac on 03.08.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import SwiftUI

struct UICheckSlider: UIViewRepresentable {

    @Binding var sliderValue: Double
    @Binding var targetValue: Double

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.alpha = 1 - abs(CGFloat((sliderValue - targetValue) / 100))
        slider.tintColor = .blue
        slider.thumbTintColor = .blue
        slider.value = Float(sliderValue)

        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        return slider
    }

    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        uiView.alpha = 1 - abs(CGFloat((sliderValue - targetValue) / 100))
    }

    func makeCoordinator() -> UICheckSlider.Coordinator {
        Coordinator(value: $sliderValue)
       }
}
extension UICheckSlider {

    class Coordinator: NSObject {
        @Binding var value: Double

        init(value: Binding<Double>) {
            self._value = value

        }

        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct UICheckSlider_Previews: PreviewProvider {
    static var previews: some View {
        UICheckSlider(sliderValue: .constant(10), targetValue: .constant(10))
    }
}
