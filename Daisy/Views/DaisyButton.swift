//
//  DaisyButton.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//

import SwiftUI

struct DaisyButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }.padding()
    }
}

struct DaisyButton_Previews: PreviewProvider {
    static var previews: some View {
        DaisyButton(title: "Button", background: Color.blue) {
            print("default action")
        }
    }
}
