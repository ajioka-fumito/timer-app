//
//  ButtonView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/24.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @Environment(\.colorScheme) private var colorScheme
    let color = Color(red:232/255,green:238/255,blue:246/255)
    let color2 = Color(red:50/255,green:50/255,blue:50/255)
    let color3 = Color(red:87/255,green:189/255,blue:201/255)
    let color3d = Color(red:47/255,green:149/255,blue:161/255)
    let color3l = Color(red:127/255,green:229/255,blue:241/255)
    var body: some View {
        VStack(){
            Group{
                Button(action:{}){
                    Text("                   ")
                        .foregroundColor(Color.black.opacity(0.5))
                }
                .padding()
                .background(
                    ZStack{
                        RoundedRectangle(cornerRadius:12,style:.continuous)
                            .foregroundColor(color)
                            .shadow(
                                color:.white,
                                radius:12,
                                x:-6,y:-8)
                            .shadow(
                                color:Color.black.opacity(0.8),
                                radius:12,
                                x:6,y:8)
                            .blendMode(.overlay)
                            .padding(2)
                        RoundedRectangle(cornerRadius:12,style:.continuous)
                            .foregroundColor(color)
                        
                        
                    }
                    
                )
            }
            .frame(width:400,height:200)
            .background(color)
            
            
            Group{
                Button(action:{}){
                    Text("Hello World")
                        .foregroundColor(Color.white)
                }
                .padding()
                .background(
                    ZStack{
                        RoundedRectangle(cornerRadius:12,style:.continuous)
                            .foregroundColor(color2)
                            
                            .shadow(
                                color:Color.black.opacity(0.8),
                                radius:12,
                                x:6,y:8)
                            .shadow(
                                color:.white,
                                radius:12,
                                x:-6,y:-8)
                            .blendMode(.overlay)
                            .padding(2)
                        RoundedRectangle(cornerRadius:12,style:.continuous)
                            .foregroundColor(color2)
                        
                        
                    }
                    
                )
            }
            .frame(width:400,height:200)
            .background(color2)
            
            Group{
                Text("           ")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(
                        ZStack{
                            RoundedRectangle(cornerRadius:12,style:.continuous)
                                .foregroundColor(color3)
                                .shadow(color:color3d,
                                        radius:12,x:8,y:4)
                                .shadow(color:color3l,
                                        radius:12,x:-8,y:-4)
                            RoundedRectangle(cornerRadius:12,style:.continuous)
                            .foregroundColor(color3)
                    })
            }
            .frame(width:400,height:200)
            .background(color3)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
