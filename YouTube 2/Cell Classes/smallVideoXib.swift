//
//  smallVideoXib.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/27/20.
//

import UIKit

class smallVideoXib: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    var video:Video?

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImageView.layer.cornerRadius = 10

    }
    
    
    

    func set(_ v:Video)
    {
       
        self.video = v
        
        guard self.video != nil else
        {
            return
        }
        
        
        self.titleLabel.text = video?.title
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        
        let date = df.string(from: video!.published)
        
        let channelTitle = video?.channelTitle
        
        let viewCount = 0
        
        descriptionLabel.text = "\(channelTitle ?? "")・\(viewCount) Views・\(date)"
        
        
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
                    
                }
                
                
            }
            
            
        }
        dataTask.resume()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}
