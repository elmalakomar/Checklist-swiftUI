//
//  ContentView.swift
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

struct ChecklistView: View {
    @State var checklistItems = [
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
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklistItems) { checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color(UIColor.systemBackground)) // this makes the entire row clickable
                    .onTapGesture(perform: {
                        print("The user tapped \(checklistItem.name)")
                        if let machingIndex = self.checklistItems.firstIndex(where: { $0.id == checklistItem.id}) {
                            self.checklistItems[machingIndex].isChecked.toggle()
                        }
                    })
                }
                .onMove(perform: moveListItem)
                .onDelete(perform: deleteListItem)
                
            }
            .navigationBarItems(trailing: EditButton())
            .navigationTitle("Checklist")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChecklistView()
        }
    }
}
