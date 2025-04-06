//
//  SearchContactsUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

struct SearchContactsUseCase {
    func execute(query: String, contacts: [Contact]) -> [Contact] {
        guard !query.isEmpty else { return contacts }
        return contacts.filter {
            $0.firstName.localizedCaseInsensitiveContains(query) ||
            $0.lastName.localizedCaseInsensitiveContains(query) ||
            $0.email.localizedCaseInsensitiveContains(query)
        }
    }
}
