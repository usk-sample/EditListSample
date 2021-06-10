//
//  ContentView.swift
//  EditListSample
//
//  Created by Yusuke Hasegawa on 2021/06/10.
//

import SwiftUI

struct ContentView: View {
    
    @State private var fruits = ["apple", "orange", "banana", "pineapple", "strawberry", "mango", "melon"]
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach.init(fruits, id: \.self) { fruit in
                    Text(fruit)
                }.onDelete(perform: { indexSet in
                    debugPrint(indexSet)
                    self.fruits.remove(atOffsets: indexSet)
                }).onMove(perform: { indices, newOffset in
                    debugPrint(indices)
                    debugPrint(newOffset)
                    self.fruits.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarTitle("Edit List", displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
