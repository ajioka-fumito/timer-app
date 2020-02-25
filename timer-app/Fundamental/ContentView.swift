//
//  ContentView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI
import Foundation
struct ContentView: View {
    @EnvironmentObject var data : Data
    var body: some View{
        NavigationView{
            ZStack{
                Color.base.edgesIgnoringSafeArea(.all)
                VStack(alignment: .center, spacing: 100){
                    Spacer()
                        .frame(height: 50.0)
                    NavigationLink(destination: SimpleTimerSettingView()){
                        Text("Simple Timer")
                            .frame(width:UIScreen.width(17,20))
                            .font(.custom("", size: 50))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                neumorphismBackground()
                        )
                    }.navigationBarTitle(Text(""))
                    
                    NavigationLink(destination: CustomTimerSettingView()){
                        Text("Custom Timer")
                            .frame(width:UIScreen.width(17,20))
                            .font(.custom("", size: 50))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                neumorphismBackground()
                        )
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
