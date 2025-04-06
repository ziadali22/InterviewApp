//
//  DeleteContactUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

protocol DeleteContactUseCaseProtocol {
    func execute(contact: Contact)
}

struct DeleteContactUseCase: DeleteContactUseCaseProtocol {
    let repository: ContactRepository
    func execute(contact: Contact) {
        repository.deleteContact(contact)
    }
}
