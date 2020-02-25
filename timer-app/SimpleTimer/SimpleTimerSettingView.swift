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
                                .font(.custom("",size:20))
                        }
                    }
                    .frame(width:self.data.width5,height:100)
                    .clipped()
                    Text("h")
                        .frame(width:self.data.width20,height:100)
                    // minute
                    Picker(selection: self.$data.minute, label: Text("")){
                        ForEach(0 ..< 60){ minute in
                            Text("\(minute)")
                                .tag(minute)
                                .font(.custom("",size:20))
                        }
                    }
                    .frame(width:self.data.width5,height:100)
                    .clipped()
                    Text("m")
                        .frame(width:self.data.width20,height:100)
                    
                    // second
                    Picker(selection: self.$data.second, label: Text("")){
                        ForEach(0 ..< 24){ second in
                            Text("\(second)")
                                .tag(second)
                                .font(.custom("",size:20))
                        }
                    }
                    .frame(width:self.data.width5,height:100)
                    .clipped()
                    Text("s")
                        .frame(width:self.data.width20,height:50)
                }
                .frame(width:self.data.width20*18,height:150)
                .foregroundColor(.white)
                .background(
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width:self.data.width15*14)
                        .foregroundColor(self.data.simpleBase)
                            .shadow(color: self.data.simpleBaseLight, radius: 12, x: -6, y: -6)
                            .shadow(color: self.data.simpleBaseDark, radius: 12, x: 6, y: 6)
                    }
                    )
                
                Spacer()
                    .frame(width:UIScreen.main.bounds.size.width,height:150)
                Button(action:{
                    if (self.data.hour+self.data.minute+self.data.second)>0{
                        self.isModal = true
                    }
                }){
                    
                    Text("START")
                        .frame(width:UIScreen.main.bounds.size.width/2,height: 100)
                        .font(.custom("", size: 50))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            ZStack{
                                RoundedRectangle(cornerRadius: 12,style: .continuous)
                                    .foregroundColor(self.data.simpleBase)
                                    .shadow(color: self.data.simpleBaseLight, radius: 12, x: -6, y: -6)
                                    .shadow(color: self.data.simpleBaseDark,radius:12,x:6,y:6)
                                
                            }
                    )
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
