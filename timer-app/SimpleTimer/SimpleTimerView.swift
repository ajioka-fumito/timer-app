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
            Color.base.edgesIgnoringSafeArea(.all)
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
                        neumorphismBackground().frame(width:UIScreen.width(18,20),height:150)
                )
                Spacer()
                    .frame(width:10,height:UIScreen.height(1,5))
                
                HStack{
                    Button(action:{self.timer.start()}){
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width:UIScreen.width(1, 5),          height:UIScreen.width(1, 5))
                            .foregroundColor(Color.base)
                            .background(
                               Circle()
                                .frame(width:UIScreen.width(1, 5)-1,
                                       height:UIScreen.width(1, 5)-1)
                                .foregroundColor(.white)
                                .shadow(color: Color.baseLight, radius: 12, x: -6, y: -6)
                                .shadow(color: Color.baseDark, radius: 12, x: 6, y: 6)
                        )
                    }
                    
                    Spacer().frame(width:UIScreen.width(1,12))
                    
                    Button(action:{self.timer.stop()}){
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width:UIScreen.width(1, 5), height:UIScreen.width(1, 5))
                            .foregroundColor(Color.base)
                            .background(
                                Circle()
                                .frame(width:UIScreen.width(1, 5)-1,
                                       height:UIScreen.width(1, 5)-1)
                                .foregroundColor(.white)
                                .shadow(color: Color.baseLight, radius: 12, x: -6, y: -6)
                                .shadow(color: Color.baseDark, radius: 12, x: 6, y: 6)
                        )
                    }
                    Spacer().frame(width:UIScreen.width(1,12))
                    Button(action:{self.timer.reset()}){
                        ZStack{
                            Circle()
                            .frame(width:UIScreen.width(1, 5)-1,
                                   height:UIScreen.width(1, 5)-1)
                                .foregroundColor(Color.base)
                            .shadow(color: Color.baseLight, radius: 12, x: -6, y: -6)
                            .shadow(color: Color.baseDark, radius: 12, x: 6, y: 6)
                            Image(systemName: "gobackward")
                                .resizable()
                                .frame(width:UIScreen.width(1, 8), height:UIScreen.width(1, 8))
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
