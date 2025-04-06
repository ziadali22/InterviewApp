//
//  AddContactsView.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 04/04/2025.
//

import SwiftUI

struct AddContactsView: View {
    // MARK: - Variables
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ContactsViewModel
    @State private var contactData: Contact = .init(id: UUID().uuidString, firstName: "", lastName: "", email: "")
    


    var body: some View {
        NavigationStack {
            VStack {
                FormView(contactData: $contactData)
            }
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel").bold()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addContact()
                        dismiss()
                    } label: {
                        Text("Done").bold()
                    }
                }
            }
        }
    }
}

private extension AddContactsView {
    func addContact() {
        viewModel.addContact(contactData)
        
    }
}

#Preview {
    AddContactsView()
        .environmentObject(ContactsViewModel())
}
