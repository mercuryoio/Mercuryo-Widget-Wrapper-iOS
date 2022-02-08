//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import Foundation


@objc(MRCRWidgetErrorCode)
public enum WidgetErrorCode: Int {
    
    case invalidCustomURL = 0
    case initializationFailed = 1
    case photoLibraryAuthorizationFailed = 2
    
}


// MARK: - CustomStringConvertible

extension WidgetErrorCode: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .invalidCustomURL:
            return "Invalid Custom URL"
        case .initializationFailed:
            return "Initialization Failed"
        case .photoLibraryAuthorizationFailed:
            return "Photo Library Authorization Failed"
        }
    }
}
