import Foundation

class Firebase {
    func start(id: String, completion: (String) -> Void) {
        print("Start Firebase")
    }
    
    func log(event: String) {
        print("Log event \(event) in Firebase")
    }
}

class Facebook {
    func start(key: String, completion: (String) -> Void) {
        print("Start FacebookAnalytics")
    }
    
    func log(event: String) {
        print("Log event \(event) in Facebook")
    }
}

class AppsFlyer {
    func start(completion: (String) -> Void) {
        print("Start AppsFlyerAnalytics")
    }
    
    func log(event: String) {
        print("Log event \(event) in AppsFlyer")
    }
}
