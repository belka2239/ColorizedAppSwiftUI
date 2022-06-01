//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by VG on 30.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)).ignoresSafeArea()
            
            VStack() {
                VStack(spacing: 40) {
                    ColorView(red: red, green: green, blue: blue)
                    
                    VStack {
                        ColorSliderView(sliderValue: $red, color: .red)
                        ColorSliderView(sliderValue: $green, color: .green)
                        ColorSliderView(sliderValue: $blue, color: .blue)
                    }
                    .frame(height: 150)
                }
                .padding()
                Spacer()
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
