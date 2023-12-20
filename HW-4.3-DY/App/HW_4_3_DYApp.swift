//
//  HW_4_3_DYApp.swift
//  HW-4.3-DY
//
//  Created by Denis Yarets on 20/12/2023.
//

import SwiftUI

@main
struct HW_4_3_DYApp: App {
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(UserManagerVM())
        }
    }
}
