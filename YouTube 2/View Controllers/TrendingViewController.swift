//
//  TrendingViewController.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/27/20.
//

import UIKit

class TrendingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 300
        
        let nib = UINib(nibName: "videoCellView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "myCell")

        // Do any additional setup after loading the view.
    }
    
    
    @objc func profileTapped(_ sender: Any) {
        performSegue(withIdentifier: "profileTapped", sender: self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    var index = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "videoInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! videoXib
        
        cell.profileImageView.addTarget(self, action: #selector(profileTapped(_:)), for: .touchUpInside)
        
        return cell
    }

}
