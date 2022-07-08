import Foundation

public struct LotteryMetadata{
   
    private init(){}
    public static let shared:LotteryMetadata = LotteryMetadata()
    
    public func data(for year:Int) ->Data?{
        guard let url = Bundle.module.url(forResource: year.description, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {return nil}
        return data
    }
    
    public func dirs(for year:Int) ->[Dictionary<String,Any>]{
        guard let data = data(for: year) else {return []}
        guard let dirs = try? PropertyListSerialization.propertyList(from: data, format: .none) as? [Dictionary<String,Any>] else {return []}
        return dirs
    }
    
}
