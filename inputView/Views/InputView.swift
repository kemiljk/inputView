//
//  InputView.swift
//  inputView
//
//  Created by Karl Koch on 05/07/2022.
//

import SwiftUI

struct InputView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(spacing: 16) {
                        TextEntryField(label: "Enter first name", text: $firstName, borderOnFocus: { $0 ? Color(.systemTeal) : Color(.lightGray) }, titleForegroundOnSelection: { $0 ? Color(.darkGray) : Color(.lightGray)})
                            .frame(width: UIScreen.main.bounds.width - 48, height: 48)
                        TextEntryField(label: "Enter last name", text: $lastName, borderOnFocus: { $0 ? Color(.systemTeal) : Color(.lightGray) }, titleForegroundOnSelection: { $0 ? Color(.darkGray) : Color(.lightGray)})
                            .frame(width: UIScreen.main.bounds.width - 48, height: 48)
                    }
                }
                .padding(.top, 16)
                Spacer()
            }
            .navigationTitle("Profile")
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
