//
//  UpdateContactUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

struct UpdateContactUseCase {
    let repository: ContactRepository
    func execute(contact: Contact) {
        repository.updateContact(contact)
    }
}
