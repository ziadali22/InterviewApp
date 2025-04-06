import Foundation
import SwiftUI

final class ContactsViewModel: ObservableObject {
    @Published private(set) var contacts: [Contact] = []
    
    private let getContactsUseCase: GetContactsUseCaseProtocol
    private let addContactUseCase: AddContactUseCaseProtocol
    private let deleteContactUseCase: DeleteContactUseCaseProtocol
    private let updateContactUseCase: UpdateContactUseCaseProtocol
    private let searchContactsUseCase: SearchContactsUseCaseProtocol

    init() {
        // Using the default repository which handles both local and remote data sources
        let repository = ContactRepositoryImpl()
        self.getContactsUseCase = GetContactsUseCase(repository: repository)
        self.addContactUseCase = AddContactUseCase(repository: repository)
        self.deleteContactUseCase = DeleteContactUseCase(repository: repository)
        self.updateContactUseCase = UpdateContactUseCase(repository: repository)
        self.searchContactsUseCase = SearchContactsUseCase(repository: repository)
        
        fetchContacts()
    }
    
    func fetchContacts() {
        contacts = getContactsUseCase.execute()
    }
    
    func addContact(_ contact: Contact) {
        addContactUseCase.execute(contact: contact)
        fetchContacts()
    }
    
    func deleteContact(_ contact: Contact) {
        deleteContactUseCase.execute(contact: contact)
        fetchContacts()
    }
    
    func updateContact(_ contact: Contact) {
        updateContactUseCase.execute(contact: contact)
        fetchContacts()
    }
    
    func searchResults(for query: String) -> [Contact] {
        return searchContactsUseCase.execute(query: query)
    }
}
