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
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
                .environmentObject(ContentModel())
        }
    }
}
