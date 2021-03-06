//
//  Terminals_Test_AppApp.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 26.07.2021.
//

import SwiftUI

@main
struct Terminals_Test_App: App
{
    
    @StateObject var content = ContentModel()
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(content)
        }
    }
}
