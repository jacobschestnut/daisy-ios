//
//  EntryFormView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/21/23.
//

import SwiftUI

//ADD SOME SORT OF TRANSITION ONCE COMPLETE

struct EntryFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: EntryFormViewViewModel
    @State private var isDatePickerVisible = false
    let dateFormatter: DateFormatter
    
    var date: Binding<Date> {
        $viewModel.date
    }
    
    init(recipe: Recipe? = nil) {
        _viewModel = StateObject(wrappedValue: EntryFormViewViewModel(recipe: recipe))
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
                    if viewModel.canSave {
                        viewModel.save()
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

//struct EntryFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryFormView(recipe: Recipe(id: 1, name: "Old Fashioned", description: "This is a cocktail."))
//    }
//}
