//
//  EntryCardView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/27/23.
//

import SwiftUI

struct EntryCardView: View {
    let entry: Entry
    var height: CGFloat = 100
    
    var body: some View {
        HStack {
            Text("\(Date(timeIntervalSince1970: entry.date).formatted(.dateTime.day()))")
                .padding()
                .border(.black)
            
            HStack(alignment: .bottom) {
                Text(entry.name)
                    .bold()
                
                Text(entry.location)
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                Spacer()
            }
        }
    }
}

struct EntryCardView_Previews: PreviewProvider {
    static var previews: some View {
        EntryCardView(entry: Entry(id: "123", userId: "user", name: "Old Fashioned", description: "Test Description", location: "Bastion", date: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970))
    }
}
