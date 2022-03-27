//
//  File.swift
//  
//
//  Created by David Diego Gomez on 24/03/2022.
//

import Foundation

public protocol LeanplumRepositoryAnalyticsProtocol {
    func trackScreen(name: String, parameters: [String: Any])
    
    func trackEvent(event: String, parameters: [String: Any])
    
    func setUserID(userId: String)
}

public class LeanplumRepositoryAnalytics: LeanplumRepositoryAnalyticsProtocol {
    public init() {}
    
    public func trackScreen(name: String, parameters: [String: Any]) {
        let params = parameters
        //        params[AnalyticsParameterScreenName] = name
        //        trackEvent(event: AnalyticsEventScreenView, parameters: params)
        print("\(name) \(params)")
    }
    
    public func trackEvent(event: String, parameters: [String: Any]) {
        //        Analytics.logEvent(event, parameters: parameters)
        print("\(event) \(parameters)")
        
    }
    
    public func setUserID(userId: String) {
        //        Analytics.setUserID(userId)
        print("\(userId)")
        
    }
}

