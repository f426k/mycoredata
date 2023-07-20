//
//  ContentView.swift
//  MyCoreData
//
//  Created by Fuka Takashima on 2023/07/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext)var viewContext

    @FetchRequest(sortDescriptors: [])
    var humans: FetchedResults<Human>

    @State var name = ""

    var body: some View {
        List {
            ForEach(humans) {human in
                if((human.name?.isEmpty) == false) {
                    HStack{
                        if(human.checked){
                            Text("☑︎")
                        }else{
                            Text("□")
                        }
                        Button(action: {human.checked.toggle()}){
                            Text(human.name!)
                        }
                    }
                }
            }

            TextField("人間の名前", text: $name)
                .onSubmit {
                    addHuman()
                }
            Button(action: deleteHuman){
                Text("人間を減らす")
            }
        }
    }

    func addHuman() {
        let newHuman = Human(context: viewContext)
        newHuman.name = name
        do{
            try viewContext.save()
        } catch {
            fatalError("セーブ失敗")
        }

        name = ""
    }

    func deleteHuman() {
        for human in humans {
            if(human.checked) {
                viewContext.delete(human)
            }
        }

        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
