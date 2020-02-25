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
    @Published var width8 = UIScreen.main.bounds.size.width/8
    @Published var width10 = UIScreen.main.bounds.size.width/10
    @Published var width12 = UIScreen.main.bounds.size.width/12
    @Published var width15 = UIScreen.main.bounds.size.width/15
    @Published var width20 = UIScreen.main.bounds.size.width/20
    @Published var height3 = UIScreen.main.bounds.size.height/3
    @Published var height5 = UIScreen.main.bounds.size.height/5
    @Published var height8 = UIScreen.main.bounds.size.height/8
    @Published var height10 = UIScreen.main.bounds.size.height/10
    @Published var height12 = UIScreen.main.bounds.size.height/12
    @Published var height15 = UIScreen.main.bounds.size.height/15
    @Published var height20 = UIScreen.main.bounds.size.height/20
    // hour minute second
    @Published var hour:Int = 0
    @Published var minute:Int = 3
    @Published var second:Int = 0
    // content color
    @Published var contentBase:Color = Color(red:87/255,green:189/255,blue:201/255)
    @Published var contentBaseLight:Color = Color(red:127/255,green:229/255,blue:241/255)
    @Published var contentBaseDark:Color = Color(red:47/255,green:149/255,blue:161/255)
    
    // simple timer color
    @Published var simpleBase:Color = Color(red:87/255,green:189/255,blue:201/255)
    @Published var simpleBaseLight:Color = Color(red:127/255,green:229/255,blue:241/255)
    @Published var simpleBaseDark:Color = Color(red:47/255,green:149/255,blue:161/255)
}
