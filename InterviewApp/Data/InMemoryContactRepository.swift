//
//  InMemoryContactRepository.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

import Foundation
final class InMemoryContactRepository: ContactRepository {
    private var contacts: [Contact] = [
        .init(id: "1", firstName: "ziad", lastName: "ali", email: "ziad@gmail.com"),
        .init(id: "2", firstName: "ahmed", lastName: "ali", email: "ahmed@gmail.com"),
        .init(id: "3", firstName: "ibrahim", lastName: "sameh", email: "ibrhaemsameh@gmail.com")
    ]
    
    func fetchContacts() -> [Contact] {
        return contacts
    }
    
    func addContact(_ contact: Contact) {
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
