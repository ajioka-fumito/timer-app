//
//  SimpleTimerObject.swift
//  timer-app
//
//  Created by Ajioka Fumito on 2020/02/24.
//  Copyright © 2020 Ajioka Fumito. All rights reserved.
//

import Foundation
import UIKit
class TimerObject:ObservableObject{
    @Published var counter:CGFloat = 0
    var timer = Timer()
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ _ in
            self.counter -= 0.1
        }
    }
    func stop(){
        timer.invalidate()
    }
    func reset(){
        timer.invalidate()
        self.counter = 0
    }
    
    func sub(_ hour:Int, _ minute:Int, _ second:Int)->DateComponents{
        let dateTo1 = Calendar.current.date(from:DateComponents(hour:hour,minute:minute,second:second))!
        let dateTo2 = Calendar.current.date(byAdding: .second, value: Int(self.counter) , to: dateTo1)!
        
        return Calendar.current.dateComponents([.hour,.minute,.second], from: dateTo2)
    }
    func timetoSecond(_ hour:Int,_ minute:Int,_ second: Int)-> CGFloat {
        return CGFloat(hour*3600+minute*60+second)
    }
}
