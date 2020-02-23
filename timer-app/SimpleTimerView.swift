//
//  SimpleTimerView.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/23.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import SwiftUI

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
        let View =
            VStack{
                Text(String(format:"%02d:%02d:%02d",time.hour!,time.minute!,time.second!))
                    .font(.custom("AppleSDGothicNeo", size: 100))
                    .foregroundColor(self.data.simpleAcce)
                
                HStack{
                    Button(action:{self.timer.start()}){
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width:self.data.width5, height:self.data.width5)
                            .foregroundColor(self.data.simpleAcce)
                    }
                    Spacer().frame(width:self.data.width12)
                    Button(action:{self.timer.stop()}){
                        Image(systemName: "pause.circle")
                            .resizable()
                            .frame(width:self.data.width5, height:self.data.width5)
                            .foregroundColor(self.data.simpleAcce)
                    }
                    Spacer().frame(width:self.data.width12)
                    Button(action:{self.timer.reset()}){
                        Image(systemName: "gobackward")
                            .resizable()
                            .frame(width:self.data.width5, height:self.data.width5)
                            .foregroundColor(self.data.simpleAcce)
                    }
                }
        }
        return View
    }
}

class TimerObject:ObservableObject{
    @Published var counter:Int = 0
    var timer = Timer()
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            self.counter -= 1
        }
    }
    
    func stop(){
        timer.invalidate()
    }
    
    func reset(){
        timer.invalidate()
        self.counter = 0
    }
    
    
    var dateFrom = Calendar.current.date(from:DateComponents(year:2000,month:1,day:1,hour:0,minute:0,second:0))!
    func sub(_ hour:Int, _ minute:Int, _ second:Int)->DateComponents{
        let dateTo1 = Calendar.current.date(from:DateComponents(year:2000,month:1,day:1,hour:hour,minute:minute,second:second))!
        let dateTo2 = Calendar.current.date(byAdding: .second, value: self.counter , to: dateTo1)!
        return Calendar.current.dateComponents([.hour,.minute,.second], from: dateTo2)
    }
}


struct SimpleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTimerView().environmentObject(Data())
    }
}
