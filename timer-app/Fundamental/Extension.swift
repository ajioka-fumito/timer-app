//
//  Extension.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/25.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

extension Color{
    static let base:Color = Color(red:87/255,green:189/255,blue:201/255)
    static let baseLight:Color = Color(red:127/255,green:229/255,blue:241/255)
    static let baseDark:Color = Color(red:47/255,green:149/255,blue:161/255)
}

extension UIScreen{
    static func width(_ times:CGFloat, _ divides:CGFloat)->CGFloat{
        return (UIScreen.main.bounds.width/divides)*times
    }
    static func height(_ times:CGFloat, _ divides:CGFloat)->CGFloat{
        return (UIScreen.main.bounds.height/divides)*times
    }
}

