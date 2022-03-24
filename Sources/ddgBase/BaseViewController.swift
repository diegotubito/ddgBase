import UIKit

public class BaseViewController<TAnalytic>: UIViewController where TAnalytic: BaseAnalyticsProtocol {
    var analytics: TAnalytic!
    
    var analyticPlatform: AnalyticPlatforms {
        return AnalyticPlatforms.All
    }
    
    var identifier: String {
        return String(describing: type(of: self))
    }
    
    internal func analyticsInit() {
        fatalError("analitycs need to be initialized at \(identifier)")
    }
    
    public override func viewDidLoad() {
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

public protocol Coordinator {
    var children: [Coordinator]? { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}


protocol Storyboarded {
    static func instatiate(name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instatiate(name: String) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        let identifier = String(describing: self)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? Self
        return vc!
    }
    
}
