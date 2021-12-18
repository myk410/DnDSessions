//
//  StrahdModel.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/16/21.
//

import Foundation

class CampaignModel: ObservableObject {
    
    @Published var campaigns = [Campaign]()
    
    init() {
        
        getRemoteData()
        
    }
    
    func getRemoteData() {
        
        // String path
        let urlString = "https://myk410.github.io/Strahd/Strahd.json"
        
        // Create a url object
        let url = URL(string: urlString)
        
        guard url != nil else{
            // Couldn't create url
            return
        }
        
        // Create a URLRequest object
        let request = URLRequest(url: url!)
        
        // Get the url session and kick off the task
        let urlSession = URLSession.shared
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            // Check if there's an error
            guard error == nil else{
                // There was an error
                return
            }
            
            do{
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode
                let campaigns = try decoder.decode([Campaign].self, from: data!)
                
                // Put sessions into self.sessions
                self.campaigns = campaigns
            }catch{
                // Couldn't parse json
                print("ANSWER?")
                print(error)
            }
            
        }
        
        // Kick off data task
        dataTask.resume()
        
    }
}
