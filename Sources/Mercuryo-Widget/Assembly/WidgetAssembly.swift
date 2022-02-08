//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import Foundation


@objc(MRCRWidgetAssembly)
public final class WidgetAssembly: NSObject {
    
    
    // MARK: - Private Properties
    
    private let configuration: WidgetConfiguration
    
    private weak var uiDelegate: WidgetUIDelegate?
    
    
    // MARK: - Init
    
    @objc
    public init(
        configuration: WidgetConfiguration,
        uiDelegate: WidgetUIDelegate?
    ) {
        self.configuration = configuration
        self.uiDelegate = uiDelegate
    }
    
    
    // MARK: - Public Methods
    
    @objc
    public final func build() -> UIViewController {
        let viewController: UIViewController
        if #available(iOS 14.3, *) {
            viewController = WebViewController(
                url: configuration.url,
                uiDelegate: uiDelegate
            )
        } else {
            viewController = SafariViewController(
                url: configuration.url,
                uiDelegate: uiDelegate
            )
        }
        
        return viewController
    }
}
