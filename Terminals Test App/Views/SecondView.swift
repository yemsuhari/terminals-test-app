//
//  SecondView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 25.10.2021.
//

import SwiftUI

struct SecondView: View
{
    
    @State var from = ""
    @State var to = ""
    
    @State var searchTextOne = ""
    @State var searchTextTwo = ""
    @State var searchingOne = false
    @State var searchingTwo = false
    
    @State var whereId = "0"
    
    @StateObject var content = ContentModel()
    
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
                            TextField("Откуда", text: $searchTextOne)
                            { startedEditing in
                                if startedEditing
                                {
                                    withAnimation
                                    {
                                        searchingOne = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    searchingOne = false
                                }
                            }
                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                    }
                    
                    
                    // "Куда"
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(Color("White"))
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            TextField("Куда", text: $searchTextTwo)
                            { startedEditing in
                                if startedEditing
                                {
                                    withAnimation
                                    {
                                        searchingTwo = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    searchingTwo = false
                                }
                            }

                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                    }

                    
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SecondView()
    }
}
