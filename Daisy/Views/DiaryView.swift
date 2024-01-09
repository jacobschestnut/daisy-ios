//
//  DiaryView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/27/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct DiaryView: View {
    //    let userId: String
    @StateObject var viewModel: DiaryViewViewModel
    @FirestoreQuery var entries: [Entry]
    @State private var selectedEntry: Entry?
    
    init(userId: String) {
        //        self.userId = userId
        self._entries = FirestoreQuery(
            collectionPath: "users/\(userId)/entries"
        )
        self._viewModel = StateObject(
            wrappedValue: DiaryViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(entries) { entry in
                    EntryCardView(entry: entry)
                        .swipeActions {
                            Button {
                                viewModel.delete(id: entry.id)
                            } label: {
                                Image(systemName: "trash.fill")
                            }
                            .tint(.red)
                        }
                        .frame(maxWidth: .infinity)                      .onTapGesture {
                            selectedEntry = entry // Set the selected entry when tapping the row
                        }
                }
                .listRowInsets(EdgeInsets())
                .listStyle(PlainListStyle())
                .frame( maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            }
            .sheet(item: $selectedEntry) { entry in
                EntryUpdateFormView(entry: entry)
            }
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(userId: "Hp1aJazMyOOFBw5Td3ltCE6n6aX2")
    }
}
