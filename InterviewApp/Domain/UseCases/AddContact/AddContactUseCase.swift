//
//  AddContactUseCase.swift.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

protocol AddContactUseCaseProtocol {
    func execute(contact: Contact)
}

struct AddContactUseCase: AddContactUseCaseProtocol {
    let repository: ContactRepository
    func execute(contact: Contact) {
        repository.addContact(contact)
    }
}
