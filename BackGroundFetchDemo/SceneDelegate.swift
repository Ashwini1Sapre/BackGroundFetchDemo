//
//  SceneDelegate.swift
//  BackGroundFetchDemo
//
//  Created by Knoxpo MacBook Pro on 29/01/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
    let userDefault = UserDefaults.standard
    var appIsDeadAt: Double?
    var appIsAlive: Double?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let contentView = ContentView().environment(\.managedObjectContext, context)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
        
        appIsAlive = Date().timeIntervalSince1970
        if appIsDeadAt != nil && appIsAlive != nil {
            let finalTime = (appIsAlive! - appIsDeadAt!)
            userDefault.setValue(finalTime.rounded(), forKey: "timeInBag")
            
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        appIsDeadAt = Date().timeIntervalSince1970
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}


struct SceneDelegate_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
