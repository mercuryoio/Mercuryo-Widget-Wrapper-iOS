//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import Foundation


@objc(MRCRWidgetUIDelegate)
public protocol WidgetUIDelegate {
    
    @objc(mrcrWidgetDidReceiveError:)
    func widgetDidReceiveError(_ error: WidgetError)
}
