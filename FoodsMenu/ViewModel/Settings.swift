//
//  Settings.swift
//  FoodsMenu
//
//  Created by Apple on 18/03/22.
//

import SwiftUI
import Combine

class Settings : ObservableObject{
    
    @Published var selectedModel : Model? {
        willSet(newValue){
            print("Seleccionamos el modelo")
        }
    }
    
    @Published var confirmeddModel : Model? {
        willSet(newValue){
            guard let model = newValue else { return }
            print("Confirmamos el modelo", model.name)
        }
    }
    
    var sceneObserver : Cancellable?
}
