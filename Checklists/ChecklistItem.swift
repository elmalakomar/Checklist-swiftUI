//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Omar El Malak on 26/09/2020.
//

import Foundation


struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool = false
}
