//
//  RemoteContactDataSource.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

// This Just Simulating we will add here api calls instead
final class RemoteContactDataSource {
    private var contacts: [Contact] = [
        .init(id: "4", firstName: "Sara", lastName: "Smith", email: "sara@gmail.com"),
        .init(id: "5", firstName: "John", lastName: "Doe", email: "john.doe@gmail.com"),
        .init(id: "6", firstName: "Emily", lastName: "Davis", email: "emily.davis@gmail.com")
    ]
    
    func fetchContacts() -> [Contact] {
        // Simulating network delay
        return contacts
    }
    
    func addContact(_ contact: Contact) {
        // Simulate adding contact remotely
        contacts.append(contact)
    }
    
    func deleteContact(_ contact: Contact) {
        contacts.removeAll { $0.id == contact.id }
    }
    
    func updateContact(_ contact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index] = contact
        }
    }
}
