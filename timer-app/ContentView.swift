//
//  ContentView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data : Data
    var body: some View{
        NavigationView{
            ZStack{
                self.data.contentBase.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 100){
                    Spacer()
                        .frame(height: 50.0)
                    NavigationLink(destination: SimpleTimerSettingView()){
                        Text("Simple Timer")
                            .frame(width:self.data.width20*17)
                            .font(.custom("", size: 50))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                ZStack{
                                    RoundedRectangle(cornerRadius: 12,style:.continuous)
                                        .foregroundColor(self.data.contentBase)
                                        .shadow(color: self.data.contentBaseLight,radius: 12,x:-6,y:-6)
                                        .shadow(color: self.data.contentBaseDark,radius: 12,x:6,y:6)
                                   
                                    
                            })
                            
                    }.navigationBarTitle(Text(""))
                    
                    
                    NavigationLink(destination: CustomTimerSettingView()){
                        Text("Custom Timer")
                        .frame(width:self.data.width20*17)
                        .font(.custom("", size: 50))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            ZStack{
                                RoundedRectangle(cornerRadius: 12,style:.continuous)
                                    .foregroundColor(self.data.contentBase)
                                    .shadow(color: self.data.contentBaseLight,radius: 12,x:-6,y:-6)
                                    .shadow(color: self.data.contentBaseDark,radius: 12,x:6,y:6)
                    })
                    }
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Data())
    }
}
