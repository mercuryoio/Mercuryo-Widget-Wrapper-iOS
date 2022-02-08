//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import Foundation


@objc(MRCRWidgetEnvironment)
public enum WidgetEnvironment: Int {
    
    case sandbox = 0
    case production = 1
    
    
    var baseURL: URL {
        switch self {
        case .production:
            return URL(string: "https://exchange.mercuryo.io")!
        case .sandbox:
            return URL(string: "https://sandbox-exchange.mrcr.io")!
        
        }
    }
}
