//
//  GetContactUseCase.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

import Foundation
struct GetContactsUseCase {
    let repository: ContactRepository
    func execute() -> [Contact] {
        return repository.fetchContacts()
    }
}
