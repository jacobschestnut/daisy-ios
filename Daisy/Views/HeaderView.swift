//
//  HeaderView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
        }
        .frame(height: 300)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
