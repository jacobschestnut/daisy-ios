//
//  ProfileView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/27/23.
//

import SwiftUI

struct ProfileView: View {
    @State var selectedIndex: Int? = 0
    let userId: String
    
    var body: some View {
        VStack {
            ProfileTabView(selectedIndex: $selectedIndex)
            //CHANGES TOP BAR COLOR
                .background(Color.white)
            
            switch selectedIndex {
                case 0:
                    DiaryView(userId: userId)
                case 1:
                    Text("")
                case 2:
                    ProfileDetailsView()
                default:
                    EmptyView()
            }
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userId: "Hp1aJazMyOOFBw5Td3ltCE6n6aX2")
    }
}
