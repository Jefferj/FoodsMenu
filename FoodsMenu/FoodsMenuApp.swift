//
//  FoodsMenuApp.swift
//  FoodsMenu
//
//  Created by Apple on 17/03/22.
//

import SwiftUI

@main
struct FoodsMenuApp: App {
    
    @StateObject var settings = Settings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
