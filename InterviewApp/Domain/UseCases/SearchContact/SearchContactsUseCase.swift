//
//  SearchContactsUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

protocol SearchContactsUseCaseProtocol {
    func execute(query: String) -> [Contact]
}

struct SearchContactsUseCase: SearchContactsUseCaseProtocol {
    let repository: ContactRepository
    func execute(query: String) -> [Contact] {
        let contacts = repository.fetchContacts()
        guard !query.isEmpty else { return contacts }
        return contacts.filter {
            $0.firstName.localizedCaseInsensitiveContains(query) ||
            $0.lastName.localizedCaseInsensitiveContains(query) ||
            $0.email.localizedCaseInsensitiveContains(query)
        }
    }
}
