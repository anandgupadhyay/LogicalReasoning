//
//  AngelOfHourAndMinuteHand.swift
//  LogicalReasoning
//
//  Created by Anand Upadhyay on 21/12/22.
//

import Foundation

class Clock{
    
    var hour: Double
    var minute: Double
    
    init(h: Double = 0 , m: Double = 0) {
        if (h < 0 || m < 0 || h > 12.0 || m > 60.0){
            self.hour = 0
            self.minute = 0
        }else{
            self.hour = h
            self.minute = m
        }
    }
    
    private func adjustHourAndMinute(){
        if self.hour == 12 {self.hour = 0}
        if (self.minute == 60)
        {
            self.minute = 0;
            self.hour += 1;
            if(self.hour>12){
                self.hour = self.hour - 12;
            }
        }
    }
    
    func calculateAngel()-> Double{
        
        adjustHourAndMinute()
        let hourAngel = (hour*60+minute)*0.5 // Hour hand moves 0.5 degree in 1 minute
        let minuteAngel = minute*6// Minute Hand moves 6 degree angel in one minute
        let diff = abs(hourAngel-minuteAngel)
        let angel = min(360-diff, diff)
        return angel
    }
}
