//
//  Data.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import Foundation
import SwiftUI
class Data: ObservableObject{
    // Screen size
    @Published var width3 = UIScreen.main.bounds.size.width/3
    @Published var width5 = UIScreen.main.bounds.size.width/5
    @Published var width10 = UIScreen.main.bounds.size.width/10
    @Published var width12 = UIScreen.main.bounds.size.width/12
    @Published var width15 = UIScreen.main.bounds.size.width/15
    // hour minute second
    @Published var hour = 0
    @Published var minute = 0
    @Published var second = 0
    // content color
    @Published var contentBase = Color(red:87/255,green:189/255,blue:201/255)
    @Published var contentSimpleFlame = Color(red:252/255,green:238/255,blue:191/255)
    @Published var contentCustomFlame = Color(red:254/255,green:142/255,blue:148/255)
    
    // simple timer color
    @Published var simpleBase = Color(red:252/255,green:238/255,blue:191/255)
    @Published var simpleAcce = Color(red:87/255,green:189/255,blue:201/255)
    
    
}
