//
//  File.swift
//  
//
//  Created by Jgump on 2022/7/19.
//

import Foundation

public struct Lottery{
    let issue:String
    let date:String
    let nums:String
    
    
    public  init?(dir:Dictionary<String,Any>){
        guard let issue = dir["issue"] as? String,
        let date = dir["date"] as? String,
            let nums = dir["nums"] as? String else {return nil}
        self.issue  = issue
        self.date = date
        self.nums = nums
    }
    
    public func value(_ keyPath:KeyPath<Lottery,String>) ->String{
        self[keyPath: keyPath]
    }
}
