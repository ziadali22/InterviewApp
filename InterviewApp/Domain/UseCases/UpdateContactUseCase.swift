//
//  UpdateContactUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

protocol UpdateContactUseCaseProtocol {
    func execute(contact: Contact)
}

struct UpdateContactUseCase: UpdateContactUseCaseProtocol {
    let repository: ContactRepository
    func execute(contact: Contact) {
        repository.updateContact(contact)
    }
}
