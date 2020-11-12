import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    var ids = [String]()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // Any ideas about how to fix this pyramid of doom?
        // Execution order matters!
        
        Firebase().start(id: "123") { firebaseId in
            ids.append(firebaseId)
            
            Facebook().start(key: "234") { facebookId in
                ids.append(facebookId)
                
                AppsFlyer().start { appsFlyerId in
                    ids.append(appsFlyerId)
                    
                    // more nested calls.....
                }
            }
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataService.shared.saveContext()
    }
}
