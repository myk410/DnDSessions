//
//  PlayerModel.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/16/21.
//

import Foundation
import AVKit

class PlayerModel: ObservableObject{
    
    @Published var audioPlayer: AVPlayer!
    @Published var isPlaying: Bool = false
    
    init(url: String){
        
        let url = URL(string: url)
        if url != nil {
            let playerItem = AVPlayerItem(url: url!)
            self.audioPlayer = AVPlayer(playerItem: playerItem)
            
        }
    }
    
}
