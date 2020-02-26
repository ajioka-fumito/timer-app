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
    // hour minute second
    @Published var hour:Int = 0
    @Published var minute:Int = 3
    @Published var second:Int = 0
}
