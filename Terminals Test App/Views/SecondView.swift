//
//  SecondView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 25.10.2021.
//

import SwiftUI
import RealmSwift

struct SecondView: View
{
    
//    @State var from = ""
//    @State var to = ""
//    
//    @State var searchTextOne = ""
//    @State var searchTextTwo = ""
//    @State var searchingOne = false
//    @State var searchingTwo = false
//    
//    @State var whereId = "0"
    
    @EnvironmentObject var content: ContentModel
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                List
                {
                    // "Откуда"
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(.white)
                        
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            TextField("Откуда", text: $content.searchTextOne)
                            { startedEditing in
                                if startedEditing
                                {
                                    content.searchTextOne = ""
                                    withAnimation
                                    {
                                        content.searchingOne = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    content.searchingOne = false
                                }
                            }
                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                    }
                    
                    
                    
                    
                    // Список "Откуда"
                    if content.searchingOne == true
                    {
                        ForEach(content.object!.city, id: \.id)
                        { city in
                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
                                return terminal.name.hasPrefix(content.searchTextOne) || content.searchTextOne == ""
                            }), id: \.id)
                            { terminal in
                                if terminal.receiveCargo == true
                                {
                                    Button(action: {
                                        content.searchTextOne = terminal.name
                                        content.searchingOne = false
                                        UIApplication.shared.dismissKeyboard()
                                        content.fromId = terminal.id
                                    }, label: {
                                        Text(terminal.name)
                                    })
                                }
                            }
                        }
                    }
                    
                    
                    // "Куда"
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(Color("White"))
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            TextField("Куда", text: $content.searchTextTwo)
                            { startedEditing in
                                if startedEditing
                                {
                                    content.searchTextTwo = ""
                                    withAnimation
                                    {
                                        content.searchingTwo = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    content.searchingTwo = false
                                }
                            }

                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                    }
                    
                    
                    // Список "Куда"
                    if content.searchingTwo == true
                    {
                        ForEach(content.object!.city, id: \.id)
                        { city in
                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
                                return terminal.name.hasPrefix(content.searchTextTwo) || content.searchTextTwo == ""
                            }), id: \.id)
                            { terminal in
                                if (terminal.giveoutCargo == true) && (terminal.terminalDefault == true)
                                {
                                    Button(action: {
                                        content.searchTextTwo = terminal.name
                                        content.searchingTwo = false
                                        UIApplication.shared.dismissKeyboard()
                                        content.toId = terminal.id
                                    }, label: {
                                        Text(terminal.name)
                                    })
                                }
                            }
                        }
                    }
                    
                    // Сохраненные маршруты
                    HStack
                    {
                        Spacer()
                        
                        Text("Сохранённые маршруты: ")
                            .bold()
                        
                        Spacer()
                    }
                    
                    
                    ForEach(content.routesArray, id: \.id)
                    { route in
                        Button {
                            content.fromId = route.firstTerminalId
                            content.toId = route.secondTerminalId
                            
                            content.assignTextfieldsValues(firstId: route.firstTerminalId, secondId: route.secondTerminalId)
                            
                            // Присвоить соответствующие значения полям "Откуда" и "Куда"

                            
                            content.chosenView = nil
                        } label: {
                            VStack
                            {
                                HStack
                                {
                                    Spacer()
                                    
                                    ForEach(content.object!.city, id: \.id)
                                    { city in
                                        ForEach(city.terminals.terminal, id: \.id)
                                        { terminal in
                                            if terminal.id == route.firstTerminalId
                                            {
                                                Text(terminal.name)
                                            }
                                        }
                                    }

                                    Image(systemName: "arrow.right")
                                    
                                    ForEach(content.object!.city, id: \.id)
                                    { city in
                                        ForEach(city.terminals.terminal, id: \.id)
                                        { terminal in
                                            if terminal.id == route.secondTerminalId
                                            {
                                                Text(terminal.name)
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                
                            }
                            .foregroundColor(Color.blue)

                        }
                    }
                    
                }
                
            }
        }
        .navigationBarItems(
                            trailing:
                                Button(
                                    action:
                                    {
                                        content.routesArray = []
                                        do
                                        {
                                            let realm = try Realm()
                                            
                                            try realm.write
                                            {
                                                content.savedRoutesData.savedData = Data()
                                            }
                                        }
                                        catch
                                        {
                                            print("Realm Error")
                                        }
                                        
                                        
                                        
                                    }, label:
                                        {
                                            HStack
                                            {
                                                Image(systemName: "trash")
                                            }
                                            .foregroundColor(.red)
                                        }
                                )
        )
    }
}

struct SecondView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SecondView()
    }
}
