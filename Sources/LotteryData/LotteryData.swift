import Foundation

public struct LotteryData{
   
    private init(){}
    public static let shared:LotteryData = LotteryData()
    
    public func data(for year:Int) ->Data?{
        guard let url = Bundle.module.url(forResource: year.description, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {return nil}
        return data
    }
    
    public func dirs(for year:Int = 0) ->[Dictionary<String,Any>]{
        if year == 0{
             return (2003...2022).compactMap{data(for:$0)}
                .compactMap{try? PropertyListSerialization.propertyList(from:$0,options:.mutableContainers,format:.none) as? [Dictionary<String,Any>]}
                .reduce([]){$0 + $1}
                
            
        }else{
            guard let data = data(for: year) else {return []}
            guard let dirs = try? PropertyListSerialization.propertyList(from: data, format: .none) as? [Dictionary<String,Any>] else {return []}
            return dirs
        }
    }
    
    
    
}

@available(iOS 15.0.0, *)
public extension LotteryData{
    
    func lotterys(year:Int = 0) async ->[Lottery]{
        await Task{dirs(for: year).compactMap{Lottery(dir: $0)}}.value
    }
    
}
