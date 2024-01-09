//
//  ProfileTabView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/27/23.
//

import SwiftUI

struct ProfileTabView: View {
    @Binding var selectedIndex: Int?
    
    var body: some View {
        HStack {
            Spacer()
            ProfileTabViewButton(text: "Diary", index: 0, selectedIndex: $selectedIndex)
                .bold()
            Spacer()
            ProfileTabViewButton(text: "Recipes", index: 1, selectedIndex: $selectedIndex)
                .bold()
            Spacer()
            ProfileTabViewButton(text: "Profile", index: 2, selectedIndex: $selectedIndex)
                .bold()
            Spacer()
        }
        .padding()
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView(selectedIndex: .constant(nil))
    }
}
