//
//  SimpleTimerSettingView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

struct SimpleTimerSettingView: View {
    @State var isModal : Bool = false
    @EnvironmentObject var data : Data
    var body: some View {
        ZStack{
            self.data.simpleBase.edgesIgnoringSafeArea(.all)
            VStack{
                // Picker
                HStack{
                    // hour
                    Picker(selection: self.$data.hour, label: Text("")){
                        ForEach(0 ..< 24){ hour in
                            Text("\(hour)")
                                .tag(hour)
                                .font(.custom("AppleSDGothicNeo",size:20))
                        }
                    }
                    .frame(width:UIScreen.main.bounds.size.width/5,height:100)
                    .clipped()
                    Text("h")
                        .frame(width:UIScreen.main.bounds.size.width/15,height:100)
                    // minute
                    Picker(selection: self.$data.minute, label: Text("")){
                        ForEach(0 ..< 60){ minute in
                            Text("\(minute)")
                                .tag(minute)
                                .font(.custom("AppleSDGothicNeo",size:20))
                        }
                    }
                    .frame(width:UIScreen.main.bounds.size.width/5,height:100)
                    .clipped()
                    Text("m")
                        .frame(width:UIScreen.main.bounds.size.width/15,height:100)
                    
                    // second
                    Picker(selection: self.$data.second, label: Text("")){
                        ForEach(0 ..< 24){ second in
                            Text("\(second)")
                                .tag(second)
                                .font(.custom("AppleSDGothicNeo",size:20))
                        }
                    }
                    .frame(width:UIScreen.main.bounds.size.width/5,height:100)
                    .clipped()
                    Text("s")
                        .frame(width:UIScreen.main.bounds.size.width/15,height:100)
                }
                .foregroundColor(self.data.simpleAcce)
                Spacer()
                    .frame(width:UIScreen.main.bounds.size.width,height:150)
                Button(action:{self.isModal=true}){
                    
                    Text("START")
                        .frame(width:UIScreen.main.bounds.size.width/2,height: 100)
                        .font(.custom("AppleSDGothicNeo", size: 60))
                        .foregroundColor(self.data.simpleAcce)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(self.data.simpleAcce,lineWidth: 10))
                }
                .sheet(isPresented: self.$isModal){
                    SimpleTimerView().environmentObject(self.data)
                }
                Spacer()
                    .frame(width:UIScreen.main.bounds.width,height:50)
            }
        }
    }
}

struct SimpleTimerSettingView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTimerSettingView().environmentObject(Data())
    }
}
