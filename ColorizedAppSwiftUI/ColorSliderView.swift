//
//  ColorSliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by VG on 30.05.2022.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    @State private var textValue = ""
    
    var color: Color
    
    var body: some View {
        HStack {
            ColorValueTextView(value: sliderValue)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
                .onChange(of: sliderValue) { isOnFocus in
                   textValue = "\(lround(isOnFocus))"
                }
            ColorValueTextFieldView(textValue: $textValue, value: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
            sliderValue = Double(textValue) ?? 0
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(sliderValue: .constant(100), color: .red)
    }
}
