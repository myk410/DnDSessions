//
//  Date.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/17/21.
//

import Foundation

struct Dates{
    
    let months = ["","January","February","March","April","May","June","July","August","September","October","Novemeber","December"]
    
    func dateToString(month:Int,day:Int,year:Int) -> String{
        return "\(months[month]) \(day), \(year)"
    }
    
}
