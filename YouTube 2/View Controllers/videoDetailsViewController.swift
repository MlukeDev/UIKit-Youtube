//
//  videoDetailsViewController.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/20/20.
//

import UIKit
import youtube_ios_player_helper

class videoDetailsViewController: UIViewController {

    @IBOutlet weak var channelImage: UIImageView!
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var channelView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var channelTitle: UILabel!
    
    var videoID = ""
    var channelName = ""
    var subscriberCount = 0
    var videoDescription = ""
    var videoTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.title = videoTitle
        channelTitle.text = channelName
        
        videoView.layer.cornerRadius = 15
        channelView.layer.cornerRadius = 15
        channelImage.layer.cornerRadius = channelImage.frame.height / 2
        videoView.load(withVideoId: videoID)
        descriptionView.layer.cornerRadius = 15
    }
    
    
    
    @IBAction func Button(_ sender: Any) {
        
        videoView.playVideo()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
