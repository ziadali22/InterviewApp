//
//  DeleteContactUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

struct DeleteContactUseCase {
    let repository: ContactRepository
    func execute(contact: Contact) {
        repository.deleteContact(contact)
    }
}
