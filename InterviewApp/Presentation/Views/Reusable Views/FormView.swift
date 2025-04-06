//
//  FormView.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 04/04/2025.
//

import SwiftUI

struct FormView: View {
    
    @Binding var contactData: Contact

    var body: some View {
        Form {
            TextField("First Name", text: $contactData.firstName)
            TextField("Last Name", text: $contactData.lastName)
            TextField("Email", text: $contactData.email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
        }
    }
}

#Preview {

    FormView(contactData: .constant(.init(id: UUID().uuidString,
                                          firstName: "",
                                          lastName: "",
                                          email: "")))
}
