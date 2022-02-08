//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import UIKit
import WebKit
import PhotosUI


protocol WidgetViewControllerProtocol {
    
    var uiDelegate: WidgetUIDelegate? { get set }
    
    init(
        url URL: URL,
        uiDelegate: WidgetUIDelegate?
    )
    
    func requestPhotoLibraryAuthorizationIfNeeded()
}


// MARK: - Default Implementation

extension WidgetViewControllerProtocol {
    
    func requestPhotoLibraryAuthorizationIfNeeded() {
        if #available(iOS 14, *) {
            PHPhotoLibrary.requestAuthorization(
                for: .readWrite,
                handler: handle(phAuthorizationStatus:)
            )
        } else {
            PHPhotoLibrary.requestAuthorization(handle(phAuthorizationStatus:))
        }
    }
    
    private func handle(phAuthorizationStatus: PHAuthorizationStatus) {
        if !phAuthorizationStatus.isAuthorized {
            let error = WidgetError(
                widgetErrorCode: .photoLibraryAuthorizationFailed,
                localizedDescription: "RAW PHAuthorizationStatus: \(phAuthorizationStatus.rawValue)"
            )
            DispatchQueue.main.async {
                self.uiDelegate?.widgetDidReceiveError(error)
            }
            
        }
    }
}


// MARK: - PHAuthorizationStatus

extension PHAuthorizationStatus {
    
    fileprivate var isAuthorized: Bool {
        self == .authorized
    }
}
