//
//  ColorValueTextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by VG on 30.05.2022.
//

import SwiftUI

struct ColorValueTextFieldView: View {
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        TextField("", text: $textValue, onCommit: checkValue)
            .frame(width: 55, alignment: .trailing)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Wrong Format"),
                    message: Text("Please enter value from 0 to 255")
                )
            }
    }
}

extension ColorValueTextFieldView {
    private func checkValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 0
        textValue = "0"
    }
}

struct ColorValueTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ColorValueTextFieldView(textValue: .constant("128"),value: .constant(128))
    }
}
