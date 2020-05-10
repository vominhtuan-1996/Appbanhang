//
//  ImageViewController.swift
//  VideosApp
//
//  Created by VoMinhTuanIOS on 2/18/20.
//  Copyright © 2020 VoMinhTuanIOS. All rights reserved.
//

import UIKit
import AVFoundation

class ImageViewController: UIViewController {
    let videoPlayerView = UIView()
    var player : AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        videoPlayerView.backgroundColor = UIColor.white
        videoPlayerView.translatesAutoresizingMaskIntoConstraints = false
        let topConstraint = NSLayoutConstraint(item: videoPlayerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: videoPlayerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: videoPlayerView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: videoPlayerView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        
        view.addSubview(videoPlayerView)
        view.addConstraints([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
      //   setupVideoPlayer()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupVideoPlayer()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }

    
    func setupVideoPlayer() {
    
        guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else {
            return
        }
//       guard let urls = Bundle.main.url(forResource: "videohat", withExtension:"mp4") else {
//            return
//       }
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoPlayerView.bounds
        videoPlayerView.layer.addSublayer(playerLayer)
        player?.play()
    }
}
