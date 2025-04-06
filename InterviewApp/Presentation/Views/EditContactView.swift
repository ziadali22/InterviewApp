//
//  EditContactView.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 05/04/2025.
//

import SwiftUI

struct EditContactView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ContactsViewModel

    
    @State private var contact: Contact
    @State private var contactDidChange: Bool = false
    @State private var showExitConfirmation: Bool = false
    @State private var showDeleteConfirmation: Bool = false
    
    private let originalContact: Contact
    
    init(contact: Contact) {
        _contact = State(initialValue: contact)
        self.originalContact = contact
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                FormView(contactData: $contact)
                
                Button("Delete") {
                    showDeleteConfirmation.toggle()
                }
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .onChange(of: contact, { oldValue, newValue in
                contactDidChange = newValue != originalContact
            })
            .alert("Exit Alert Confirmation", isPresented: $showExitConfirmation, actions: {
                Button("Stay", role: .cancel){}
                Button("Discard Changes", role: .destructive) {
                    dismiss()
                }
            })
            .alert("Delete Confirmation", isPresented: $showDeleteConfirmation, actions: {
                Button("Cancel", role: .cancel){}
                Button("Delete", role: .destructive) {
                    deleteContact()
                }
            })
            .navigationTitle("Edit Contact")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        showExitAlert()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        updateContact()
                    }
                    .disabled(!contactDidChange)
                    .opacity(contactDidChange ? 1 : 0.5)
                }
            }
        }
    }
}

extension EditContactView {
    func updateContact() {
        viewModel.updateContact(contact)
        dismiss()
    }
    
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func showExitAlert() {
        if contactDidChange {
            showExitConfirmation = true
        } else {
            dismiss()
        }    }
}

#Preview {
    let viewModel = ContactsViewModel()
    EditContactView(contact: .init(id: UUID().uuidString,
                                   firstName: "ziad",
                                   lastName: "ali",
                                   email: "ziad@gmail.com"))
    .environmentObject(viewModel)
}
