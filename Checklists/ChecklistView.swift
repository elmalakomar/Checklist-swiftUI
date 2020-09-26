//
//  ContentView.swift
//  Checklists
//
//  Created by Omar El Malak on 23/09/2020.
//

import SwiftUI




struct ChecklistView: View {
    
    @ObservedObject var checklist = Checklist()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklist.checklistItems) { checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color(UIColor.systemBackground)) // this makes the entire row clickable
                    .onTapGesture(perform: {
                        print("The user tapped \(checklistItem.name)")
                        if let machingIndex = self.checklist.checklistItems.firstIndex(where: { $0.id == checklistItem.id}) {
                            self.checklist.checklistItems[machingIndex].isChecked.toggle()
                        }
                    })
                }
                .onMove(perform: checklist.moveListItem)
                .onDelete(perform: checklist.deleteListItem)
                
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
