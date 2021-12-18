//
//  StrahdView.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/16/21.
//

import SwiftUI

struct CampaignView: View {
    
    var campaign:Campaign
    
    var body: some View {
        ZStack {
            Background(color_1: Color(.sRGB, white: 0.2, opacity: 0.9), color_2: .black)
            VStack{
                Text("\(campaign.title)")
                    .font(Font.custom("Cochin", size: 35))
                    .bold()
                    .padding(.horizontal)
                    .foregroundColor(.white)
                ScrollView{
                    LazyVStack(alignment:.leading){
                        ForEach(campaign.sessions){ session in
                            NavigationLink(destination: SessionView(session: session), label: {
                                
                                Tab(id:session.id,title: "\(session.title)", color_1: Color.black, color_2: Color(red: 65, green: 0, blue: 0),size: 20, bold: false)
                            })
                        }
                    }
                }
            }
        }
    }
}
struct CampaignView_Previews: PreviewProvider {
    
    static var previews: some View {
        CampaignView(campaign: Campaign(id: 1, title: "The Curse of Strahd", sessions: [Session(id: 1, title: "Welcome to Daggerford", description: "", highlights: [""], date: [2,23,1987], url: "")]) )
    }
}
