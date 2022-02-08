//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import SafariServices


final class SafariViewController: SFSafariViewController, WidgetViewControllerProtocol {
    
    
    // MARK: - Public Properties
    
    weak var uiDelegate: WidgetUIDelegate?
    
    
    // MARK: - Internal Init
    
    convenience init(
        url URL: URL,
        uiDelegate: WidgetUIDelegate?
    ) {
        self.init(url: URL)
        
        self.uiDelegate = uiDelegate
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requestPhotoLibraryAuthorizationIfNeeded()
    }
}
