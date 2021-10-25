//
//  SearchingView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 20.10.2021.
//

import SwiftUI

struct SearchingView: View
{
    
    @StateObject var content = ContentModel()
    
    var body: some View
    {
        
        Text(content.object?.city.first?.name ?? "Hello")
    }
}

struct SearchingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SearchingView()
    }
}
