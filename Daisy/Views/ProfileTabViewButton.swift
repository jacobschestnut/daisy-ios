//
//  ProfileTabViewButton.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/27/23.
//

import SwiftUI

struct ProfileTabViewButton: View {
    let text: String
    let index: Int
    @Binding var selectedIndex: Int?
    
    var body: some View {
        Text(text)
            .font(selectedIndex == index ? .system(size: 16, weight: .bold) : .system(size: 17, weight: .bold))
            .foregroundColor(selectedIndex == index ? .white : .black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(selectedIndex == index ? Color.blue : Color.clear)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(selectedIndex == index ? Color.blue : Color.clear, lineWidth: 2)
            )
            .onTapGesture {
                selectedIndex = index
            }
    }
}

struct ProfileTabViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabViewButton(text: "Third View", index: 0, selectedIndex: .constant(0))
    }
}
