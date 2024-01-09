//
//  EntryUpdateFormView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 1/4/24.
//

import SwiftUI

//ADD SOME SORT OF TRANSITION ONCE COMPLETE

struct EntryUpdateFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: EntryUpdateFormViewViewModel
    @State private var isDatePickerVisible = false
    let dateFormatter: DateFormatter
    let entry: Entry
    
    var date: Binding<Date> {
        $viewModel.date
    }
    
    init(entry: Entry) {
        self.entry = entry
        _viewModel = StateObject(wrappedValue: EntryUpdateFormViewViewModel(entry: entry))
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $viewModel.name)
                
                //ADD IMAGE
                
                Button(action: {
                    withAnimation {
                        isDatePickerVisible.toggle()
                    }
                }) {
                    Text(dateFormatter.string(from: date.wrappedValue))
                }
                
                if isDatePickerVisible {
                    DatePicker(
                        "",
                        selection: $viewModel.date,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.wheel)
                }
                
                TextField("Description", text: $viewModel.description)
                
                //CHANGE TEXT TO ACTUAL LOCATION
                TextField("Location", text: $viewModel.location)
                
                DaisyButton(title: "Save", background: .green) {
                    if viewModel.canUpdate {
                        viewModel.update(entry: entry)
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields.")
                )
            }
        }
    }
}

//struct EntryUpdateFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryFormView(recipe: Recipe(id: 1, name: "Old Fashioned", description: "This is a cocktail."))
//    }
//}
