//
//  ChannelViewController.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/23/20.
//

import UIKit

class ChannelViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var channelTitleVar = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        channelTitle.text = channelTitleVar
        navBar.title = channelTitleVar
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let nib = UINib(nibName: "SmallVideoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        tableView.rowHeight = 80
        channelIcon.layer.cornerRadius = channelIcon.frame.size.height / 2
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! smallVideoXib
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "channelToVideo", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
