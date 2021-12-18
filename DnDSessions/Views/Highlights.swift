//
//  Highlights.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/18/21.
//

import SwiftUI

struct Highlights: View {
    
    var campaignTitle: String
    var session:Session
    
    var body: some View {
        
        ScrollView{
            VStack {
                Text("Highlights")
                    .font(Font.custom("Cochin", size: 35))
                    .bold()
                    .padding()
                Text(campaignTitle)
                    .font(Font.custom("Cochin", size: 25))
                Text("Session \(session.id):")
                    .font(Font.custom("Cochin", size: 15))
                    .padding(.top,5)
                Text(session.title)
                    .font(Font.custom("Cochin", size: 20))
                    .bold()
                    .padding(.bottom)
                VStack(alignment:.leading){
                    
                    ForEach(session.highlights, id: \.self){ highlight in
                        HStack(alignment:.top){
                            Text("•")
                                .font(Font.system(size: 25))
                            Text(highlight)
                                .padding(.top,5)
                        }.padding(.horizontal)
                            .padding(.bottom)
                            
                    }
                }
            }
        }
    }
}

struct Highlights_Previews: PreviewProvider {
    static var previews: some View {
        Highlights(campaignTitle: "The Curse of Strahd", session: Session(id: 1, title: "Welcome to Daggerford", description: "", highlights: ["Ernst helps us escape Izek and his guards.","We are brought to Lady Watcher and are introduced to the resistance.","Lady watcher commissions us to capture the Burgomaster, Baron Vargas Vallakovich, and kill Izek for the murder of her husband."], date: [2,23,1987], url: ""))
    }
}
