//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import UIKit
import MRCRWidget


final class ViewController: UIViewController {
    
    
    // MARK: - Private Properties
    
    private weak var widgetViewController: UIViewController?
    
    
    // MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showWidget()
    }
    
    
    // MARK: - Private Methods
    
    private func showWidget() {
        do {
            let configuration = try WidgetConfiguration(widgetId: "")
            let vc = WidgetAssembly(
                configuration: configuration,
                uiDelegate: self
            )
                .build()
            
            self.present(vc, animated: true)
            self.widgetViewController = vc
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    private func showAlert() {
        let alertController = UIAlertController(
            title: "Access Denied",
            message: "Please grant access to your photo library",
            preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(
                title: "OK",
                style: .default
            )
        )
        
        widgetViewController?.present(
            alertController,
            animated: true
        )
    }
}


// MARK: - WidgetUIDelegate

extension ViewController: WidgetUIDelegate {
    
    func widgetDidReceiveError(_ error: WidgetError) {
        switch error.errorCode {
        case .photoLibraryAuthorizationFailed:
            showAlert()
            
        default:
            break
        }
    }
}
