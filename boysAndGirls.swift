import Foundation
import UIKit

class boysAndGirls {
    var name = ""
    var gender = ""
    var born = ""
    var height = ""
    var image = UIImage(named: "")
    
    func tipsFromMales() -> String {
        var tipsFromMales = [
        "Keep Trying",
        "Don't Give Up",
        "Be Aggressive"
        ]
        var randomIndex = Int(arc4random_uniform(UInt32(tipsFromMales.count)))
        return tipsFromMales[randomIndex]
    }
    
    func tipsFromFemales() -> String {
        var tipsFromFemales = [
            "Be nice",
            "Be a gentleman",
            "Make lots of money"
        ]
        var randomIndex = Int(arc4random_uniform(UInt32(tipsFromFemales.count)))
        return tipsFromFemales[randomIndex]
    }
}