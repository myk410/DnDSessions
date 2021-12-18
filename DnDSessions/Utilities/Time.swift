//
//  Time.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/17/21.
//

import Foundation

struct Time{
    
    func secToStr(seconds:Double) -> String {
        
        var secInt = Int(seconds)
        var minInt = 0
        var hours = 0
        
        var secStr = ""
        var minStr = ""
        
        // Set seconds and minutes
        if secInt >= 60 {
            minInt = secInt/60
            secInt = secInt%60
        }
        
        // Set minutes and hours
        if minInt >= 60 {
            hours = minInt/60
            minInt = minInt%60
        }
        
        // Set Seconds String
        if String(secInt).count < 2{
            secStr = "0\(secInt)"
        }else{
            secStr = "\(secInt)"
        }
        
        if hours != 0 {
            if String(minInt).count < 2{
                minStr = "0\(minInt)"
            }else{
                minStr = "\(minInt)"
            }
            return "\(hours):\(minStr):\(secStr)"
        }else{
            minStr = String(minInt)
            return "\(minStr):\(secStr)"
        }
        
    }
    
}
