//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import UIKit
import WebKit


final class WebViewController: UIViewController, WidgetViewControllerProtocol {
    
    
    // MARK: - Public Properties
    
    weak var uiDelegate: WidgetUIDelegate?
    
    
    // MARK: - Private Properties
    
    private var webView: WKWebView {
        self.view as! WKWebView
    }
    
    private let url: URL
    
    
    // MARK: - Internal Init
    
    init(
        url URL: URL,
        uiDelegate: WidgetUIDelegate?
    ) {
        self.url = URL
        self.uiDelegate = uiDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    // MARK: - Unavailable Init
    
    @available(*, unavailable)
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) is unavailable.")
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is unavailable.")
    }
    
    @available(*, unavailable)
    init() {
        fatalError("init is unavailable.")
    }
    
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = WKWebView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
        
        self.requestPhotoLibraryAuthorizationIfNeeded()
    }
    
    
    // MARK: - Private Methods
    
    private func loadWebView() {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
