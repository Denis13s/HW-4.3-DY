//
//  UserManagerVM.swift
//  HW-4.3-DY
//
//  Created by Denis Yarets on 20/12/2023.
//

import SwiftUI

final class UserManagerVM: ObservableObject {
    
    @AppStorage("nameStored") var nameStored = ""
    @AppStorage("hasLoggedIn") var hasLoggedIn = false
    
    @Published var name = "" { didSet { objectWillChange.send() } }
    
    var nameCharactersCount: Int {
        name.count
    }
    
    var isValid: Bool {
        nameCharactersCount > 2
    }
    
    func logIn() {
        if isValid {
            UserDefaults.standard.setValue(name, forKey: "nameStored")
            UserDefaults.standard.setValue(true, forKey: "hasLoggedIn")
        }
    }
    
}
