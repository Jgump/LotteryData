import Foundation

public struct LotteryMetadata{
   
    private init(){}
    public static let shared:LotteryMetadata = LotteryMetadata()
    
    public func data(for year:Int) ->Data?{
        guard let url = Bundle.module.url(forResource: year.description, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {return nil}
        return data
    }
    
}
