//
//  Lottery.swift
//  
//
//  Created by Jgump on 2022/7/8.
//

import UIKit

public class Lottery: NSObject {
    
    @objc public var type:String
    @objc public var issue:String
     @objc public var date:String
     @objc public var num1:Int
     @objc public var num2:Int
     @objc public var num3:Int
     @objc public var num4:Int
     @objc public var num5:Int
     @objc public var num6:Int
     @objc public var num7:Int
    
   public init(t:String,i:String,d:String,n1:Int,n2:Int,n3:Int,n4:Int,n5:Int,n6:Int,n7:Int){
        self.type = t
        self.issue = i
        self.date = d
        self.num1 = n1
        self.num2 = n2
        self.num3 = n3
        self.num4 = n4
        self.num5 = n5
        self.num6 = n6
        self.num7 = n7
       super.init()
    }
    
    public init?(for dir:Dictionary<String,Any>){
        guard let type = dir["type"] as? String,
              let issue = dir["issue"] as? String,
              let date = dir["date"] as? String,
              let nums = dir["nums"] as? String else {return nil}
        let numValues = nums.split(separator: ",").compactMap{Int($0)}
        guard numValues.count == 7 else {return nil}
        self.type = type
        self.issue = issue
        self.date = date
        self.num1 = numValues[0]
        self.num2 = numValues[1]
        self.num3 = numValues[2]
        self.num4 = numValues[3]
        self.num5 = numValues[4]
        self.num6 = numValues[5]
        self.num7 = numValues[6]
        super.init()
    }
}
