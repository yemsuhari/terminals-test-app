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
       Text("Hello World")
    }
}

struct SecondView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SecondView()
    }
}
