//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import Foundation


@objc(MRCRWidgetError)
public final class WidgetError: NSError {
    
    
    // MARK: - Public Properties
    
    @objc
    public let errorCode: WidgetErrorCode
    
    
    // MARK: - Internal Init
    
    @objc
    public init(
        widgetErrorCode: WidgetErrorCode,
        localizedDescription: String
    ) {
        self.errorCode = widgetErrorCode
        
        super.init(
            domain: .standardWidgetErrorDomain,
            code: widgetErrorCode.rawValue,
            userInfo: [
                NSLocalizedDescriptionKey: "\(String(describing: widgetErrorCode)). \(localizedDescription)"
            ]
        )
    }
    
    
    // MARK: - Unavailable Init
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is unavailable.")
    }
    
    @available(*, unavailable)
    public init() {
        fatalError("init is unavailable.")
    }
}


// MARK: - String

extension String {
    
    fileprivate static var standardWidgetErrorDomain: String { "io.mercuryo.widget" }
}
