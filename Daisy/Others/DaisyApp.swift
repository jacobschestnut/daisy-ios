//
//  DaisyApp.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import FirebaseCore
import SwiftUI

@main
struct DaisyApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
