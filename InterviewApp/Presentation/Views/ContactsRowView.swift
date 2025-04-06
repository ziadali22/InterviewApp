//
//  ContactsRowView.swift
//  InterviewApp
//
//  Created by Ziad Khalil on 04/04/2025.
//

import SwiftUI

struct ContactsRowView: View {
    let contacts: Contact
    
    var body: some View {
        HStack {
            Text("\(contacts.initals)")
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .clipShape(.circle)
            VStack(alignment: .leading) {
                Text("\(contacts.firstName) \(contacts.lastName)")
                Text(contacts.email)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ContactsRowView(contacts: .init(id: "1", firstName: "ziad", lastName: "ali", email: "ziadali@gmail.com"))
}
