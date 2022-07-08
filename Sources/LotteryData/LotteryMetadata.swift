import Foundation
private class BundleFinder{}

extension Bundle{
    
   public static var module:Bundle = {
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL
        ]
        
        for url in candidates {
            let path = url?.appendingPathComponent("LotteryData.bundle")
            if let bundle = path.flatMap(Bundle.init(url:)){
                return bundle
            }
        }
        fatalError("unable to rfind bundle named DataForDoubleColorBall")
    }()
}
public struct LotteryMetadata{
   
    private init(){}
    public static let shared:LotteryMetadata = LotteryMetadata()
    
    public func data(for year:Int) ->Data?{
        guard let url = Bundle.module.url(forResource: year.description, withExtension: "plist"),
              let data = try? Data(contentsOf: url) else {return nil}
        return data
    }
    
}
