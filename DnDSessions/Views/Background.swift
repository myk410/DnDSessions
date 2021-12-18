//
//  Background.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/17/21.
//

import SwiftUI

struct Background: View {
    
    var color_1: Color
    var color_2: Color
    
    var body: some View {
        
        ZStack{
            GeometryReader{ geo in
                EllipticalGradient(colors: [color_1,color_2])
            }
        }.ignoresSafeArea()
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(color_1: .gray, color_2: .black)
        
        
    }
}
