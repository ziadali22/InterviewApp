//
//  ContentView.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 03/04/2025.
//

import SwiftUI

struct ContactsView: View {
    
    @StateObject private var viewModel = ContactsViewModel()

    @State private var searchText: String = ""
    @State private var showAddContactView: Bool = false
    @State private var selectedContact: Contact?
    
    var searchResults: [Contact] {
        return viewModel.searchResults(for: searchText)
    }
    var body: some View {
        NavigationStack {
            List(searchResults) { contact in

                NavigationLink(destination: EditContactView(contact: contact).environmentObject(viewModel)) {
                    ContactsRowView(contacts: contact)
                        .swipeActions {
                            Button {
                                viewModel.deleteContact(contact)
                            }label: {
                                Image(systemName: "trash")
                                    
                            }
                            .tint(.red)
                        }
                }
            }

            .sheet(isPresented: $showAddContactView) {
                AddContactsView()
                    .environmentObject(viewModel)
                    .presentationDetents([.height(300)])
            }
            .navigationTitle("Contacts")
            .searchable(text: $searchText, prompt: "Search")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddContactView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContactsView()
}
