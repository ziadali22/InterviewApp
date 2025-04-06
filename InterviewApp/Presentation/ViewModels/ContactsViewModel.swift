import Foundation
import SwiftUI


//class ContactsViewModel: ObservableObject {
//    @Published var contacts = [Contact]()
//    
//    init() {
//        fetchContacts()
//    }
//    
//    private func fetchContacts() {
//        contacts = [
//            .init(id: "1", firstName: "ziad", lastName: "ali", email: "ziad@gmail.com"),
//            .init(id: "2", firstName: "ahmed", lastName: "ali", email: "ahmed@gmail.com"),
//            .init(id: "3", firstName: "ibrahim", lastName: "sameh", email: "ibrhaemsameh@gmail.com")
//        ]
//    }
//    
//    func addContact(_ contact: Contact) {
//        contacts.append(contact)
//    }
//    
//    func deleteContact(_ contact: Contact) {
//        guard let index = contacts.firstIndex(where: {$0.id == contact.id }) else { return }
//        contacts.remove(at: index)
//    }
//    
//    func updateContact(_ contact: Contact) {
//        guard let index = contacts.firstIndex(where: {$0.id == contact.id }) else { return }
//        contacts[index] = contact
//    }
//    
//    func searchResults(for query: String) -> [Contact] {
//        guard !query.isEmpty else {
//            return contacts
//        }
//        
//        return contacts.filter {
//            $0.firstName.localizedCaseInsensitiveContains(query) ||
//            $0.lastName.localizedCaseInsensitiveContains(query)  ||
//            $0.email.localizedCaseInsensitiveContains(query)
//        }
//    }
//}


final class ContactsViewModel: ObservableObject {
    @Published private(set) var contacts: [Contact] = []
    
    private let getContactsUseCase: GetContactsUseCase
    private let addContactUseCase: AddContactUseCase
    private let deleteContactUseCase: DeleteContactUseCase
    private let updateContactUseCase: UpdateContactUseCase
    private let searchContactsUseCase = SearchContactsUseCase()

    init(repository: ContactRepository = InMemoryContactRepository()) {
        self.getContactsUseCase = GetContactsUseCase(repository: repository)
        self.addContactUseCase = AddContactUseCase(repository: repository)
        self.deleteContactUseCase = DeleteContactUseCase(repository: repository)
        self.updateContactUseCase = UpdateContactUseCase(repository: repository)
        
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
        return searchContactsUseCase.execute(query: query, contacts: contacts)
    }
}
