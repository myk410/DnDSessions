//
//  ContentView.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model:CampaignModel
    
    var body: some View {
        NavigationView{
        ZStack {
            Background(color_1: Color(.sRGB, white: 0.2, opacity: 0.9), color_2: .black)
        
            VStack(alignment:.leading) {
                Spacer()
                Text("D&D Sessions")
                        .foregroundColor(.white)
                        .font(Font.system(size: 35))
                        .bold()
                        .padding(20)
                ScrollView{
                    LazyVStack(alignment:.leading){
                        ForEach(model.campaigns){ campaign in
                            NavigationLink(destination: CampaignView(campaign: campaign), label: {
                                
                                Tab(title: campaign.title, color_1: Color.gray, color_2: Color.black,size:30)
                                
                                
                            })
                        }
                        
                }.navigationBarHidden(true)
                }
            }
    }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CampaignModel())
    }
}
