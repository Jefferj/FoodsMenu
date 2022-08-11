//
//  ControlView.swift
//  FoodsMenu
//
//  Created by Apple on 17/03/22.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var showMenu : Bool
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            HStack(alignment: .center){
                Button {
                   print("Abrir menú")
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .buttonStyle(PlainButtonStyle())
                }
                .frame(width: 50, height: 50)
                .sheet(isPresented: $showMenu){
                    MenuView(showMenu: $showMenu)
                }
                }

            }
            .frame(maxWidth: 500)
            .padding(30)
            .background(Color.black.opacity(0.25))

        }
    }

