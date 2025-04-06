//
//  GetContactUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

protocol GetContactsUseCaseProtocol {
    func execute() -> [Contact]
}

struct GetContactsUseCase: GetContactsUseCaseProtocol {
    let repository: ContactRepository
    func execute() -> [Contact] {
        return repository.fetchContacts()
    }
}
