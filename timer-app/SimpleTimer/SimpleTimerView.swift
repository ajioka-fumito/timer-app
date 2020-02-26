//
//  SimpleTimerView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI
import UIKit
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
struct CircleProgress:View{
    var percentage:CGFloat = 10
    var body: some View{
        ZStack{
            // outside circle
            Circle()
                .frame(width:UIScreen.width(8.5,10),height:UIScreen.width(8.5,10))
                .foregroundColor(Color.base)
                .shadow(color:Color.baseLight,radius:12,x:-6,y:-6)
                .shadow(color:Color.baseDark,radius:12,x:6,y:6)
            // progress base line
            Circle()
            .frame(width:UIScreen.width(7.5,10),height:UIScreen.width(7.5,10))
            .foregroundColor(Color.baseDark)
            // progress bar
            Circle()
                    .fill(Color.clear)
                .frame(width:UIScreen.width(6.5,10),height:UIScreen.width(6.5,10))
                    .overlay(
                        Circle()
                            .trim(from:0,to:percentage*0.01)
                            .stroke(style:StrokeStyle(lineWidth: 40, lineCap: .butt, lineJoin: .round))
                            .fill(AngularGradient(gradient:.init(colors:[Color.white]),center:.center,
                                                  startAngle:.init(degrees:0),endAngle: .init(degrees: 360)))
                ).animation(.spring(response:1.0,dampingFraction:1.0,blendDuration:1.0))
                .rotationEffect(.degrees(270))
            // inside sircle
            Circle()
                .frame(width:UIScreen.width(6.2,10),height:UIScreen.width(6.2,10))
                .foregroundColor(Color.base)
        }
        
    }
}
struct TimerView: View {
    @EnvironmentObject var data:Data
    @ObservedObject var timer = TimerObject()
    var body: some View{
        let time = self.timer.sub(self.data.hour, self.data.minute, self.data.second)
        let second = self.timer.timetoSecond(self.data.hour, self.data.minute, self.data.second)
        let soundIdRing:SystemSoundID = 1009
        if (time.hour!+time.minute!+time.second!)==0 {
            AudioServicesPlaySystemSound(soundIdRing)
            self.timer.stop()
        }
        let View =
            VStack{
                
                
                CircleProgress(percentage: -1*CGFloat(self.timer.counter)*100/second)
                
                Spacer().frame(width:UIScreen.width(1,6),height:UIScreen.width(1,4))
                
                Text(String(format:"%02d:%02d:%02d",time.hour!,time.minute!,time.second!))
                    .font(.custom("AppleSDGothicNeo", size: 80))
                    .foregroundColor(.white)
                    .background(
                        neumorphismBackground().frame(width:UIScreen.width(18,20),height:150)
                )
                
                
                Spacer()
                    .frame(width:10,height:UIScreen.height(1,10))
                
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
