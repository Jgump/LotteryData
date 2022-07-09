//
//  Lottery.swift
//  
//
//  Created by Jgump on 2022/7/8.
//

import Foundation

public class Lottery: NSObject {
    
     @objc public let type:String
     @objc public let issue:String
     @objc public let date:String
     @objc public let num1:Int
     @objc public let num2:Int
     @objc public let num3:Int
     @objc public let num4:Int
     @objc public let num5:Int
     @objc public let num6:Int
     @objc public let num7:Int
    
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
    
    public static let previewMax:Lottery = Lottery(t: "ssq", i: "22100", d:"2022-11-11", n1: 28, n2: 29, n3: 30, n4: 31, n5: 32, n6: 33, n7: 16)
    public static let previewMin:Lottery = Lottery(t: "ssq", i: "22001", d: "2022-01-01", n1: 1, n2: 2, n3: 3, n4: 4, n5: 5, n6: 6, n7: 7)
}

extension Lottery{
        
    
    
    
    
    public func nextOrLast(isNext:Bool) ->Lottery?{
        let year:Int =  Int(date.split(separator: "-").first?.description ?? "") ?? 0
        let lotterys = LotteryData.shared.dirs(for: year).compactMap{Lottery(for: $0)}
        let result = lotterys.filter {
            guard let issueInt = Int(issue),let currentIssueInt = Int($0.issue) else {return false}
            return currentIssueInt == (isNext ? issueInt + 1 : issueInt - 1)
        }
        return result.first
    }
}
