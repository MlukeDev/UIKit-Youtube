//
//  CacheManager.swift
//  YouTube 2
//
//  Created by Matt Luke on 8/23/20.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url:String, _ data:Data?)
    {
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data?
    {
        return cache[url]
    }
    
}
