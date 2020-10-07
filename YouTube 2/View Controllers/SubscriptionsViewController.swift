//
//  SubscriptionsViewController.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/27/20.
//

import UIKit

class SubscriptionsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var allChannelsButton: UIButton!
    @IBOutlet weak var channelButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 300
        
        //channelButtonView.layer.cornerRadius = 15

        let nib = UINib(nibName: "videoCellView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "myCell")
        
        
    }
    
    @objc func profileTapped(_ sender: Any) {
        performSegue(withIdentifier: "profileTapped", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! videoXib
        
        cell.profileImageView.addTarget(self, action: #selector(profileTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
    
    var index = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "videoInfo", sender: self)
    }

}
