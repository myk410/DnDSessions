//
//  SessionView.swift
//  DnDSessions
//
//  Created by G. Michael Fortin Jr on 12/16/21.
//

import SwiftUI
import AVKit

struct SessionView: View {
    
    var campaignTitle:String
    var session:Session
    @State var audioPlayer: AVPlayer!
    @State var isPlaying: Bool = false
    @State var playValue = 0.0
    @State var playerDuration = 100.0
    @State var currentSeconds = 0.0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State var currentDate = Date()
    
    var body: some View {
        
        TabView{
            VStack {
                
                Text("Session \(session.id):")
                    .font(Font.system(size: 20))
                    .padding(.top)
                Text("\(session.title)")
                    .font(.title)
                Text(Dates().dateToString(month: session.date[0], day: session.date[1], year: session.date[2]))
                    .padding(.top,1)
                    .font(Font.system(size: 15))
                
                Spacer()
                
                
                
                if audioPlayer != nil {
                    
                    Slider(value: $playValue, in: 0.0...playerDuration, onEditingChanged: { _ in
                        changeSliderValue()
                    })
                        .onReceive(timer) { _ in
                            
                            if isPlaying {
                                if let currentTime = audioPlayer?.currentTime() {
                                    playValue = CMTimeGetSeconds(currentTime)
                                    
                                    if currentTime == CMTime(seconds: 0.0, preferredTimescale: 60000) {
                                        isPlaying = false
                                    }
                                }
                                
                            }
                            else {
                                isPlaying = false
                                self.timer.upstream.connect().cancel()
                            }
                        }
                        .padding(.horizontal)
                    
                    HStack{
                        
                        Text("\(Time().secToStr(seconds: CMTimeGetSeconds(audioPlayer != nil ? audioPlayer.currentTime() : CMTime(seconds: 0.0, preferredTimescale: 60000)) ))")
                            .onReceive(timer) { _ in
                                
                                currentSeconds =
                                CMTimeGetSeconds(audioPlayer != nil ? audioPlayer.currentTime() : CMTime(seconds: 0.0, preferredTimescale: 60000))
                            }
                        
                        Spacer()
                        Text(Time().secToStr(seconds: playerDuration))
                    }
                    .padding(.horizontal)
                }
                
                Button(action: playPause, label: {
                    Image(systemName: isPlaying ? "pause.circle.fill" :  "play.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width:50,height:50)
                })
                
                Spacer()
                
    //            Text("\(currentDate)")
    //                .onReceive(timer){ input in
    //                    currentDate = input
    //
    //                }
            }
            .tabItem {
                Image(systemName: "waveform")
            }
            
            Highlights(campaignTitle: campaignTitle, session: session)
            .tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
            }
            
            
        }.onAppear{
            let url = URL(string: session.url)
            if url != nil {
                
                let playerAsset = AVAsset(url: url!)
                
                let playerItem = AVPlayerItem(asset: playerAsset, automaticallyLoadedAssetKeys: ["duration"])
                
                self.audioPlayer = AVPlayer(playerItem: playerItem)
                
                playerDuration = CMTimeGetSeconds(audioPlayer.currentItem!.asset.duration)
                
            }
            
            do{ try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)}
            catch{
                print(error)
            }
        }
    }
    
    func playPause() {
        if self.audioPlayer != nil {
            if isPlaying {
                self.audioPlayer.pause()
            }else{
                self.audioPlayer.play()
            }
            isPlaying.toggle()
            
        }else{
            print("audioPlayer = nil")
        }
    }
    
    func changeSliderValue() {
        
        if isPlaying == true {
            audioPlayer.pause()
            audioPlayer.seek(to: CMTime(seconds: playValue, preferredTimescale: 60000))
            audioPlayer.play()
            
        }
        
        if isPlaying == false {
            audioPlayer.seek(to: CMTime(seconds: playValue, preferredTimescale: 60000))
            
        }
    }
    
}

struct SessionView_Previews: PreviewProvider {
    
    static var previews: some View {
        SessionView(campaignTitle: "The Curse of Strahd", session: Session(id: 1, title: "Welcome to Daggerford", description: "", highlights: [""], date: [2,23,1987], url: "https://feeds.soundcloud.com/stream/1178566330-g-michael-fortin-strahd-001.mp3"))
    }
}
