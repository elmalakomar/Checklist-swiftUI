//
//  ContentView.swift
//  Checklists
//
//  Created by Omar El Malak on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = ["Walk the dog",
                          "Brush my teeth",
                          "Learn iOS development",
                          "Soccer practice",
                          "Eat ice cream"]
    
    func deleteListItem(whichElement: IndexSet) {
        checklistItems.remove(atOffsets: whichElement)
    }
    
    func moveListItem(whichElement: IndexSet, destination:Int) {
        checklistItems.move(fromOffsets: whichElement, toOffset: destination)
    }
    
    var body: some View {
        NavigationView{
            List {
                ForEach(checklistItems, id: \.self) { item in
                    Text(item)
                        .onTapGesture{
                            self.checklistItems.append(item)
                        }
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
            ContentView()
        }
    }
}
