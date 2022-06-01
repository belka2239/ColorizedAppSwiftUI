//
//  ColorValueTextView.swift
//  ColorizedAppSwiftUI
//
//  Created by VG on 30.05.2022.
//

import SwiftUI

struct ColorValueTextView: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 35, alignment: .leading)
            .foregroundColor(.white)
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ColorValueTextView(value: 128)
    }
}
