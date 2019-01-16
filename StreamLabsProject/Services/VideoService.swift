//
//  VideoService.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import Foundation

public class VideoService {
    
    public class func returnHardcodedVideoList() -> [Video] {
        
        let v1 = Video(coverImage: "https://cdn.livestreamfails.com/thumbnail/5c103d4253e05.jpg",
                       hashtag: "#fortnite1",
                       streamURL: "https://stream.livestreamfails.com/video/5c103d427afc4.mp4")
        
        let v2 = Video(coverImage: "https://cdn.livestreamfails.com/thumbnail/5b4a7a5b39a16.jpg",
                       hashtag: "#fortnite2",
                       streamURL: "https://stream.livestreamfails.com/video/5b4a7a5b5f955.mp4")
        
        let v3 = Video(coverImage: "https://cdn.livestreamfails.com/thumbnail/5b8da14d69d8f.jpg",
                       hashtag: "#fortnite3",
                       streamURL: "https://stream.livestreamfails.com/video/5b8da14d97b70.mp4")
        
        let v4 = Video(coverImage: "https://cdn.livestreamfails.com/thumbnail/5accda5db4e86.jpg",
                       hashtag: "#fortnite4",
                       streamURL: "https://stream.livestreamfails.com/video/5accda5dceff7.mp4")
        
        let v5 = Video(coverImage: "https://cdn.livestreamfails.com/thumbnail/5b8d93f2268b4.jpg",
                       hashtag: "#fortnite5",
                       streamURL: "https://stream.livestreamfails.com/video/5b8d93f2584d5.mp4")
        
        let v6 = Video(coverImage: "https://cdn.livestreamfails.com/thumbnail/5b205bf57f6ee.jpg",
                       hashtag: "#fortnite6",
                       streamURL: "https://stream.livestreamfails.com/video/5b205bf5a4113.mp4")
        
        return [v1, v2, v3, v4, v5, v6]
        
    }
    
    
}
