//
//  ContentView.swift
//  EditListSample
//
//  Created by Yusuke Hasegawa on 2021/06/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fruits = ["apple", "orange", "banana", "pineapple", "strawberry", "mango", "melon"]
    
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach.init(fruits, id: \.self) { fruit in
                    Text(fruit)
                }.onDelete(perform: { indexSet in
                    self.fruits.remove(atOffsets: indexSet)
                }).onMove(perform: { indices, newOffset in
                    self.fruits.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarTitle("Edit List", displayMode: .inline)
            .navigationBarItems(trailing: Button.init(action: { self.editMode = self.editMode.isEditing ? .inactive : .active }, label: {
                if self.editMode.isEditing {
                    Image.init(systemName: "checkmark")
                } else {
                    Image.init(systemName: "square.and.pencil")
                }
            }))
            .environment(\.editMode, self.$editMode)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
