//
//  HomeViewController.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/20/20.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "videoCellView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "myCell")
        
        model.getVideos()
        
        tableView.rowHeight = 300
        
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
    }
    
    @objc func profileTapped(_ sender: Any) {
        performSegue(withIdentifier: "channelInfo", sender: self)
        
    }
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        tableView.reloadData()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! videoXib
        
        //cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2
        cell.profileImageView.addTarget(self, action: #selector(profileTapped(_:)), for: .touchUpInside)
        
        cell.set(videos[indexPath.row])
        
        return cell
        
    }
    
    var index = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "videoInfo", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is videoDetailsViewController
        {
            let vc = segue.destination as? videoDetailsViewController
            
            vc?.channelName = videos[index].channelTitle
            vc?.videoTitle = videos[index].title
            vc?.videoID = videos[index].videoId
        }
        else if segue.destination is ChannelViewController
        {
            let vc = segue.destination as? ChannelViewController
            
            vc?.channelTitleVar = videos[index].channelTitle
            
        }
    }
    
    
}
