//
//  videoXib.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/27/20.
//

import UIKit
 
class videoXib: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var blurImage: UIImageView!
    @IBOutlet weak var profileImageView: UIButton!
    @IBOutlet weak var cell: UITableViewCell!
    
    override func prepareForReuse() {
    super.prepareForReuse()
    
        
        
    
  }
    
    
    
    var video:Video?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 20
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        cell.selectionStyle = .none

    }
    
    
    

    func set(_ v:Video)
    {
       
        self.video = v
        
        guard self.video != nil else
        {
            return
        }
        
        
        self.videoTitle.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        
        let date = df.string(from: video!.published)
        
        let channelTitle = video?.channelTitle
        
        let viewCount = 0
        
        descriptionText.text = "\(channelTitle ?? "")・\(viewCount) Views・\(date)"
        
        
        guard self.video!.thumbnail != "" else {
            return
        }
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail)
        {
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil
            {
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                if url!.absoluteString != self.video?.thumbnail
                {
                    return
                }
                
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                    self.blurImage.image = image
                }
                
                
            }
            
            
        }
        dataTask.resume()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        // Configure the view for the selected state
    }

}
    

