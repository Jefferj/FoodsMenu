//
//  CustomARView.swift
//  FoodsMenu
//
//  Created by Apple on 18/03/22.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

class CustomARView : ARView {
    var focusEntity : FocusEntity?
    
    required init(frame: CGRect){
        super.init(frame: frame)
        focusEntity = FocusEntity(on: self, focus: .classic)
    }
    
    @MainActor @objc required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
