//
//  ContentView.swift
//  AirplayDemo
//
//  Created by Ashif Ismail on 12/02/2020.
//  Copyright © 2020 ashif. All rights reserved.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let presentinView = UIHostingController(rootView: AnyView(EmptyView()))
    @State var mVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")
    var body: some View {
        VStack {
            AVPlayerView(videoURL: self.$mVideoURL).transition(.move(edge: .bottom)).edgesIgnoringSafeArea(.all)
            Button(action: {
                self.mVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4")
            }) {
                Text("Play First Video")
            }
            
            Button(action: {
                self.mVideoURL = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
            }) {
                Text("Play Second Video")
            }
        }
        
    }
}

struct AVPlayerView: UIViewControllerRepresentable {

    @Binding var videoURL: URL?

    private var player: AVPlayer {
        return AVPlayer(url: videoURL!)
    }

    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        playerController.modalPresentationStyle = .fullScreen
        playerController.player = player
        playerController.player?.play()
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        return AVPlayerViewController()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
