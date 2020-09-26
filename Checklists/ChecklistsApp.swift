//
//  ChecklistsApp.swift
//  Checklists
//
//  Created by Omar El Malak on 23/09/2020.
//

import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}

@main
struct ChecklistsApp: App {
    var body: some Scene {
        WindowGroup {
            ChecklistView()
        }
    }
}
