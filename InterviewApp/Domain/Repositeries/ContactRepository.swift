//
//  ContactRepository.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

protocol ContactRepository {
    func fetchContacts() -> [Contact]
    func addContact(_ contact: Contact)
    func deleteContact(_ contact: Contact)
    func updateContact(_ contact: Contact)
}
