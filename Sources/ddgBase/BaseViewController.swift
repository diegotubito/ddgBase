import UIKit

open class BaseViewController<TAnalytic>: UIViewController where TAnalytic: BaseAnalyticsProtocol {
    open var analytics: TAnalytic!
    
    open var analyticPlatform: AnalyticPlatforms {
        return AnalyticPlatforms.All
    }
    
    public var identifier: String {
        return String(describing: type(of: self))
    }
    
    open func analyticsInit() {
        fatalError("analitycs need to be initialized at \(identifier)")
    }
    
    open override func viewDidLoad() {
        super .viewDidLoad()
        analyticsInit()
        trackScreen()
    }
}

extension BaseViewController {
    private func trackScreen() {
        switch analyticPlatform {
        case .Firebase:
            firebaseScreenTrack()
            break
        case .Leanplum:
            leanplumScreenTrack()
            break
        case .All:
            firebaseScreenTrack()
            leanplumScreenTrack()
            break
        case .None:
            break
        }
    }
    
    private func firebaseScreenTrack() {
        analytics.firebaseTrackScreen(name: "firebaseScreen", parameters: ["name": identifier])
    }
    
    private func leanplumScreenTrack() {
        analytics.leanplumTrackScreen(name: "leanplumScreen", parameters: ["name": identifier])
    }
}
