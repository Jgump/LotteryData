//
//  File.swift
//  
//
//  Created by Jgump on 2022/7/19.
//

import Foundation

public struct Lottery{
   public let issue:String
   public let date:String
   public let nums:String
    
    init(issue:String,date:String,nums:String){
        self.issue = issue
        self.date = date
        self.nums = nums
    }
    
    public static let preview = Lottery(issue: "08084", date: "2008-8-4 ", nums: "1,8,10,16,18,27,4")
    
    public  init?(dir:Dictionary<String,Any>){
        guard let issue = dir["issue"] as? String,
        let date = dir["date"] as? String,
            let nums = dir["nums"] as? String else {return nil}
        self.issue  = issue
        self.date = date
        self.nums = nums
    }
    
    
}
