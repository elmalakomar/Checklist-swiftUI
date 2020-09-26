//
//  Checklist.swift
//  Checklists
//
//  Created by Omar El Malak on 26/09/2020.
//

import Foundation

class Checklist: ObservableObject {
    @Published var checklistItems = [
        ChecklistItem(name: "Walk the dog"),
        ChecklistItem(name: "Brush my teeth"),
        ChecklistItem(name: "Learn iOS development", isChecked: true),
        ChecklistItem(name: "Soccer practice"),
        ChecklistItem(name: "Eat ice cream", isChecked: true)
        ]
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination:Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
    }
}
