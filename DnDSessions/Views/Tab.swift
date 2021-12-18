//
//  Tab.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/17/21.
//

import SwiftUI

struct Tab: View {
    
    var id: Int?
    var title: String
    var color_1: Color
    var color_2: Color
    var size: Int
    var bold = true
    
    
    var body: some View {
        
        
        GeometryReader{ geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(color_2)
                Rectangle()
                    .foregroundColor(color_1)
                    .position(x: geo.size.width*0.4, y: 30)
                Rectangle()
                    .foregroundColor(color_1)
                    .frame(width: 60, height:60)
                    .rotationEffect(Angle(degrees: 45))
                    .position(x: geo.size.width*0.89, y: 30)
                
                if id == nil {
                    LinearGradient(gradient: Gradient(colors: [color_2,color_1]), startPoint: .leading, endPoint: .trailing)
                        .frame(width:20)
                        .opacity(0.4)
                    
                    if bold {
                        Text(title)
                            .font(Font.custom("Cochin", size: CGFloat(size)))
                            .bold()
                            .foregroundColor(color_2)
                            .padding(.leading, 30)
                    }else{
                        Text(title)
                            .font(Font.custom("Cochin", size: CGFloat(size)))
                            .foregroundColor(color_2)
                            .padding(.leading, 30)
                    }
                }else{
                    ZStack {
                        Rectangle()
                            .foregroundColor(color_2)
                            .frame(width:50)
                        
                        Text(String(id!))
                            .foregroundColor(color_1)
                            .font(Font.custom("Cochin", size: 35))
                            .bold()
                        
                        
                    }
                    if bold {
                    Text(title)
                        .font(Font.custom("Cochin", size: CGFloat(size)))
                        .bold()
                        .foregroundColor(color_2)
                        .padding(.leading, 70)
                    }else{
                        Text(title)
                            .font(Font.custom("Cochin", size: CGFloat(size)))
                            .foregroundColor(color_2)
                            .padding(.leading, 70)
                    }
                }
                
            }
        }
        .frame(height:60)
        .clipped()
        .shadow(radius: 10)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab(id:1,title: "The House of Deathly Illusion",color_1: Color.red,color_2: Color.black,size: 20,bold: true)
    }
}
