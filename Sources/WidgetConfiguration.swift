//
//  Copyright (c) 2022-present MoneySwap OU (mercuryo.io). All rights reserved.
//

import Foundation


@objc(MRCRWidgetConfiguration)
public final class WidgetConfiguration: NSObject {
    
    
    // MARK: - Internal Properties
    
    let url: URL
    
    
    // MARK: - Init
    
    @objc
    public init(
       widgetId: String,
       widgetURL: URL,
       params: [String: Any]? = nil
    ) throws {
        var urlComponents = URLComponents(
            url: widgetURL,
            resolvingAgainstBaseURL: true
        )
        
        if urlComponents?.queryItems?.isEmpty == false {
            throw WidgetError(
                widgetErrorCode: .invalidCustomURL,
                localizedDescription: "Do not pass any additional params in the base URL. Use **params** property instead."
            )
        }
        
        let queryItem = URLQueryItem(
            name: .widgetIdKey,
            value: widgetId
        )
        urlComponents?.queryItems = [queryItem]
        
        if let params = params {
            let queryItems = params.compactMap {
                URLQueryItem(
                    name: $0,
                    value: $1 as? String
                )
            }
            urlComponents?.queryItems?.append(contentsOf: queryItems)
        }
        
        guard let url = urlComponents?.url else {
            throw WidgetError(
                widgetErrorCode: .initializationFailed,
                localizedDescription: "Cannot construct url."
            )
        }
        
        self.url = url
    }
    
    @objc
    public convenience init(
       widgetId: String,
       environment: WidgetEnvironment = .production,
       params: [String: Any]? = nil
    ) throws {
        try self.init(
            widgetId: widgetId,
            widgetURL: environment.baseURL,
            params: params
        )
    }
}


// MARK: - String

extension String {
    
    fileprivate static var widgetIdKey: String { "widget_id" }
}
