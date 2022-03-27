//
//  File.swift
//  
//
//  Created by David Diego Gomez on 24/03/2022.
//

import Foundation

public protocol FirebaseRepositoryAnalyticsProtocol {
    func trackScreen(name: String, parameters: [String: Any])
    
    func trackEvent(event: String, parameters: [String: Any])
    
    func setUserID(userId: String)
}

public class FirebaseRepositoryAnalytics: FirebaseRepositoryAnalyticsProtocol {
    public init() {}
    public func trackScreen(name: String, parameters: [String: Any]) {
        let params = parameters
        //        params[AnalyticsParameterScreenName] = name
        //        trackEvent(event: AnalyticsEventScreenView, parameters: params)
        print("\(name) \(params)")
    }
    
    public func trackEvent(event: String, parameters: [String: Any]) {
        //        Analytics.logEvent(event, parameters: parameters)
    }
    
    public func setUserID(userId: String) {
        //        Analytics.setUserID(userId)
    }
}
