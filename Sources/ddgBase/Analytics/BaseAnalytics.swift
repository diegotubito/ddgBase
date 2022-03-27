//
//  File.swift
//  
//
//  Created by David Diego Gomez on 24/03/2022.
//

import Foundation

public enum AnalyticPlatforms {
    case Firebase
    case Leanplum
    case All
    case None
}

public protocol BaseAnalyticsProtocol {
    func firebaseTrackScreen(name: String, parameters: [String: Any])
    func firebaseTrackEvent(event: String, parameters: [String: Any])
    func firebaseSetUserID(userId: String)
    
    
    func leanplumTrackScreen(name: String, parameters: [String: Any])
    func leanplumTrackEvent(event: String, parameters: [String: Any])
    func leanplumSetUserID(userId: String)
}

open class BaseAnalytics: BaseAnalyticsProtocol {
    public var firebaseRepositoryAnalytics: FirebaseRepositoryAnalyticsProtocol
    public var leanplumRepositoryAnalytics: LeanplumRepositoryAnalyticsProtocol
    
    public init(firebaseAnalytics: FirebaseRepositoryAnalyticsProtocol = FirebaseRepositoryAnalytics(),
         leanplumAnalytics: LeanplumRepositoryAnalyticsProtocol = LeanplumRepositoryAnalytics()) {
        self.firebaseRepositoryAnalytics = firebaseAnalytics
        self.leanplumRepositoryAnalytics = leanplumAnalytics
    }
    
    // conforming protocol
    public func firebaseTrackScreen(name: String, parameters: [String : Any]) {
        self.firebaseRepositoryAnalytics.trackScreen(name: name, parameters: parameters)
    }
    
    public func firebaseTrackEvent(event: String, parameters: [String: Any]) {
        self.firebaseRepositoryAnalytics.trackEvent(event: event, parameters: parameters)
    }
    
    public func firebaseSetUserID(userId: String) {
        self.firebaseRepositoryAnalytics.setUserID(userId: "userID")
    }
    
    
    
    
    public func leanplumTrackScreen(name: String, parameters: [String : Any]) {
        self.leanplumRepositoryAnalytics.trackScreen(name: name, parameters: parameters)
    }
    
    public func leanplumTrackEvent(event: String, parameters: [String: Any]) {
        self.leanplumRepositoryAnalytics.trackEvent(event: event, parameters: parameters)
    }
    
    public func leanplumSetUserID(userId: String) {
        self.leanplumRepositoryAnalytics.setUserID(userId: "userID")
    }
    
    
}


