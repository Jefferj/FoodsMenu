//
//  ContentView.swift
//  FoodsMenu
//
//  Created by Apple on 17/03/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: Home()){
                Text("Abrir menú aumentado")
            }
            
            .navigationTitle("Restaurant")
        }
    }
}


