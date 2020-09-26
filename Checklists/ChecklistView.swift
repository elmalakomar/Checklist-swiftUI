//
//  ContentView.swift
//  Checklists
//
//  Created by Omar El Malak on 23/09/2020.
//

import SwiftUI




struct ChecklistView: View {
    
    @ObservedObject var checklist = Checklist()
    @State var newChecklistItemViewIsVisible = false
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklist.items) { checklistItem in
                    HStack{
                        Text(checklistItem.name)
                        Spacer()
                        Text(checklistItem.isChecked ? "✅" : "🔲")
                    }
                    .background(Color(UIColor.systemBackground)) // this makes the entire row clickable
                    .onTapGesture(perform: {
                        print("The user tapped \(checklistItem.name)")
                        if let machingIndex = self.checklist.items.firstIndex(where: { $0.id == checklistItem.id}) {
                            self.checklist.items[machingIndex].isChecked.toggle()
                        }
                    })
                }
                .onMove(perform: checklist.moveListItem)
                .onDelete(perform: checklist.deleteListItem)
                
            }
            .navigationBarItems(
                leading: Button(action: {
                    self.newChecklistItemViewIsVisible = true
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add item")
                    }
                },
                trailing: EditButton()
            )
            .navigationTitle("Checklist")
        }
        .sheet(isPresented: $newChecklistItemViewIsVisible) {
            NewChecklistItemView(checklist: self.checklist)
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
