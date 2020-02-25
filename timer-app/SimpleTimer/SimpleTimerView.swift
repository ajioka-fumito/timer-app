//
//  SimpleTimerView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI
import AudioToolbox
struct SimpleTimerView: View {
    @EnvironmentObject var data : Data
    var body: some View {
        ZStack{
            self.data.simpleBase.edgesIgnoringSafeArea(.all)
            VStack{
                TimerView()
                
            }
        }
    }
}

struct TimerView: View {
    @EnvironmentObject var data:Data
    @ObservedObject var timer = TimerObject()
    
    
    var body: some View{
        let time = self.timer.sub(self.data.hour, self.data.minute, self.data.second)
        let soundIdRing:SystemSoundID = 1009
        if (time.hour!+time.minute!+time.second!)==0 {
            AudioServicesPlaySystemSound(soundIdRing)
            self.timer.reset()
        }
        let View =
            VStack{
                Text(String(format:"%02d:%02d:%02d",time.hour!,time.minute!,time.second!))
                    .font(.custom("AppleSDGothicNeo", size: 80))
                    .foregroundColor(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width:self.data.width20*18,height:150)
                            .foregroundColor(self.data.simpleBase)
                            .shadow(color: self.data.simpleBaseLight, radius: 12, x: -6, y: -6)
                            .shadow(color: self.data.simpleBaseDark, radius: 12, x: 6, y: 6)
                )
                Spacer()
                    .frame(width:10,height:self.data.height5)
                HStack{
                    Button(action:{self.timer.start()}){
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width:self.data.width5, height:self.data.width5)
                            .foregroundColor(self.data.simpleBase)
                            .background(
                                Circle()
                                    .frame(width:self.data.width5-1)
                                    .foregroundColor(.white)
                                    .shadow(color: self.data.simpleBaseLight, radius: 12, x: -6, y: -6)
                                    .shadow(color: self.data.simpleBaseDark, radius: 12, x: 6, y: 6)
                        )
                    }
                    Spacer().frame(width:self.data.width12)
                    Button(action:{self.timer.stop()}){
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width:self.data.width5, height:self.data.width5)
                            .foregroundColor(self.data.simpleBase)
                            .background(
                                Circle()
                                    .frame(width:self.data.width5-1)
                                    .foregroundColor(.white)
                                    .shadow(color: self.data.simpleBaseLight, radius: 12, x: -6, y: -6)
                                    .shadow(color: self.data.simpleBaseDark, radius: 12, x: 6, y: 6)
                        )
                    }
                    Spacer().frame(width:self.data.width12)
                    Button(action:{self.timer.reset()}){
                        ZStack{
                            Circle()
                                .frame(width:self.data.width5-1,height:100)
                                .foregroundColor(self.data.simpleBase)
                                .shadow(color: self.data.simpleBaseLight, radius: 12, x: -6, y: -6)
                                .shadow(color: self.data.simpleBaseDark, radius: 12, x: 6, y: 6)
                            Image(systemName: "gobackward")
                                .resizable()
                                .frame(width:self.data.width8, height:self.data.width8)
                                .foregroundColor(.white)
                        }
                    }
                }
        }
        
        return View
    }
}




struct SimpleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTimerView().environmentObject(Data())
    }
}
