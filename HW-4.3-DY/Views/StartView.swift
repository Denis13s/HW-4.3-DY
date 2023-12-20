//
//  StartView.swift
//  HW-4.3-DY
//
//  Created by Denis Yarets on 20/12/2023.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var userManagerVM: UserManagerVM
 
    var body: some View {
        if !userManagerVM.hasLoggedIn {
            LogInView()
        } else {
            ContentView()
                .environmentObject(TimerVM())
        }
    }
    
}

#Preview {
    StartView()
        .environmentObject(UserManagerVM())
        .environmentObject(TimerVM())
}
