//
//  AppDelegate.swift
//  BackGroundFetchDemo
//
//  Created by Knoxpo MacBook Pro on 29/01/21.
//

import UIKit
import CoreData
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name:"TestModel")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        
        if let error = error {
            
            fatalError("Unresolved error, \((error as NSError).userInfo)")
            
        }
        
        
        
    })
        return container
    }()
    
    
    
    func saveContext()
    {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                let nserror = error as NSError
                fatalError("\(nserror),\(nserror.userInfo)")
                
            }
            
        }
    }
    
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
//        let container = NSPersistentContainer(name:"")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//
//            if let error = error {
//
//                fatalError("UNresolved eoor, \((error as NSError).userInfo)")
//
//            }
//
//
//
//        })
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        if let url = URL(string: "https://stackoverflow.com/questions/44313278/ios10-background-fetch") {
            
            URLSession.shared.dataTask(with: url, completionHandler: { (data, respone, error) in
                
                guard let data = data else { completionHandler(.failed); return }
                let result = String (data: data ,encoding: .utf8)
                
                print("perfromFectchWithCompletionHandler result: \(String(describing: result))")
                completionHandler(.newData)
            }).resume()
            
            
            
        }
        
//      if  let tabbarItem = window?.rootViewController as? UITabBarController,
//            let viewControllers = tabbarItem.viewControllers {
//
//        for viewController in viewControllers {
//
//            if let fetchViewConroller = viewController as? FetchViewController {
//
//                fetchViewConroller.fetch {
//
//                    fetchViewConroller.updateUI()
//
//                    completionHandler(.newData)
//
//                }
//
//
//
//            }
//
//        }
//
//
//            }
        
        
        
        
        
    }


}

