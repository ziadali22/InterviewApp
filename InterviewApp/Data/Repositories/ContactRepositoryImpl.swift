//
//  LocalContactRepository.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 06/04/2025.
//

final class ContactRepositoryImpl: ContactRepository {
    private let localDataSource: LocalContactDataSource
    private let remoteDataSource: RemoteContactDataSource
    private let isRemote: Bool
    
    init(isRemote: Bool = false) {
        self.localDataSource = LocalContactDataSource()
        self.remoteDataSource = RemoteContactDataSource()
        self.isRemote = isRemote
    }
    
    func fetchContacts() -> [Contact] {
        return isRemote ? remoteDataSource.fetchContacts() : localDataSource.fetchContacts()
    }
    
    func addContact(_ contact: Contact) {
        if isRemote {
            remoteDataSource.addContact(contact)
        } else {
            localDataSource.addContact(contact)
        }
    }
    
    func deleteContact(_ contact: Contact) {
        if isRemote {
            remoteDataSource.deleteContact(contact)
        } else {
            localDataSource.deleteContact(contact)
        }
    }
    
    func updateContact(_ contact: Contact) {
        if isRemote {
            remoteDataSource.updateContact(contact)
        } else {
            localDataSource.updateContact(contact)
        }
    }
}
