//
//  FundamentalView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/26.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct neumorphismBackground:View{
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 12,style:.continuous)
                .foregroundColor(Color.base)
                .shadow(color: Color.baseLight,radius: 12,x:-6,y:-6)
                .shadow(color: Color.baseDark,radius: 12,x:6,y:6)
        }
    }
}
