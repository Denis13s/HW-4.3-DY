//
//  LogInView.swift
//  HW-4.3-DY
//
//  Created by Denis Yarets on 20/12/2023.
//

import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var userManagerVM: UserManagerVM
    @State private var textName = ""
    
    var body: some View {
        
        VStack {
            HStack {
                TextField("Enter your name", text: $textName)
                    .onChange(of: textName) {
                        userManagerVM.name = $1
                    }
                    .frame(width: 150)
                
                Text("\(userManagerVM.nameCharactersCount)")
                    .frame(width: 25, alignment: .trailing)
                    .foregroundStyle(userManagerVM.isValid ? .green : .red)
                
                Text(String(userManagerVM.hasLoggedIn))
            }
            
            Button {
                userManagerVM.logIn()
            } label: {
                Label("OK", systemImage: "checkmark")
            }
            .disabled(!userManagerVM.isValid)
        }
        .padding()
        
    }
}

#Preview {
    LogInView()
}
