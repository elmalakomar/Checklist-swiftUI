//
//  ContentView.swift
//  Checklists
//
//  Created by Omar El Malak on 23/09/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("High priority")){
                    Text("Walk the dog")
                    Text("Brush my teeth")
                    Text("Learn iOS development")
                }
                Section(header: Text("Low priority")){
                    Text("Soccer practice")
                    Text("Eat ice cream")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Checklist")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
