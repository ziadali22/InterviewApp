//
//  Contact.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 03/04/2025.
//


struct Contact: Identifiable, Hashable {
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    
    var initals: String {
        let firstNameLetter = firstName.prefix(1)
        let lastNameLetter = lastName.prefix(1)
        
        return String(firstNameLetter + lastNameLetter).uppercased()
    }
}
