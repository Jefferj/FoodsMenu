//
//  Model.swift
//  FoodsMenu
//
//  Created by Apple on 17/03/22.
//


import SwiftUI
import RealityKit
import Combine

enum ModelCategory : CaseIterable {
    case carnes
    case pizza
    case hamburguesa
    case postres
    
    var label : String {
        get {
            switch self {
            case .carnes:
                return "Carnes"
            case .pizza:
                return "Pizza"
            case .hamburguesa:
                return "Hamburguesa"
            case .postres:
                return "Postres"
            }
        }
    }
}

class Model {
    var name : String
    var category : ModelCategory
    var thumbnail :UIImage
    var modelEntity : ModelEntity!
    var scale : Float
    var cancellable : AnyCancellable?
    init(name: String, category: ModelCategory, scale: Float = 1.0) {
        self.name = name
        self.category = category
        self.thumbnail = UIImage(named: name) ?? UIImage(systemName: "photo")!
        self.scale = scale
    }
    func loadModel(){
        let filename = name + ".usdz"
        print(filename)
        cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                switch loadCompletion {
                case .failure(let error):
                    print("Error al cargar el modelo", error.localizedDescription)
                case .finished:
                    print("succes")
                    break
                }
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                self.modelEntity?.scale *= self.scale
                
            
            })
    }
}

struct Models {
    var all : [Model] = []
    
    init(){
        all = [
            Model(name: "fresa", category: .postres, scale: 3/100),
            Model(name: "vainilla", category: .postres, scale: 3/100),
            Model(name: "frambuesa", category: .postres, scale: 3/100),
            Model(name: "cereza", category: .postres, scale: 3/100),
            Model(name: "carne", category: .carnes, scale: 3/100),
            Model(name: "pollo", category: .carnes, scale: 3/100),
            Model(name: "pizza", category: .pizza, scale: 3/100),
            Model(name: "hamburguesa", category: .hamburguesa, scale: 3/100)
            ]
    }
    func get(category: ModelCategory) -> [Model] {
        return all.filter({$0.category == category})
    }
}


