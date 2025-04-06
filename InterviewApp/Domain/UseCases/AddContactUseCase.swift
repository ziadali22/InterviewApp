//
//  AddContactUseCase.swift.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

struct AddContactUseCase {
    let repository: ContactRepository
    func execute(contact: Contact) {
        repository.addContact(contact)
    }
}
