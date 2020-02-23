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
                            .font(.custom("AppleSDGothicNeo",size: 50))
                            .frame(width:320)
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(self.data.contentSimpleFlame,lineWidth: 10)
                        )
                    }
                    
                    NavigationLink(destination: CustomTimerSettingView()){
                        Text("Custom Timer")
                            .frame(width:320)
                            .font(.custom("AppleSDGothicNeo",size: 50))
                            .padding()
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius:20)
                                    .stroke(self.data.contentCustomFlame,lineWidth: 10))
                        
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
