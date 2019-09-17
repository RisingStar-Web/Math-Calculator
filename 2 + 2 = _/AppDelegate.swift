//
//  AppDelegate.swift
//  2 + 2 = ?
//
//  Created by Mac on 10.09.17.
//  Copyright © 2017 FokinMC. All rights reserved.
//

//let kAPP_KEY = "a034308b06b468af9a350979f449cbe1e194bf2475df6521"


import UIKit
import CoreData


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

//        initializeAppodealSDK()
//        configureAppearance()
        
        if #available(iOS 10.3, *) {
            RateManager.incrementCount()
        } else {
            // Fallback on earlier versions
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
//        self.saveContext()
    }

    
    
    
    // реклама 
    // MARK: Appodeal Initialization
    
//    func initializeAppodealSDK() {
        //        ~~> Custom settings <~~
        //        Appodeal.setFramework(.native)
        //        Appodeal.setPluginVersion("1.1.1")
        //
        //        ~~> Test Mode <~~
        //        Appodeal.setTestingEnabled(true)
        //
        //        ~~> User Data <~~
        //        Appodeal.setUserId("userID")
        //        Appodeal.setUserEmail("user@email.com")
        //        Appodeal.setUserBirthday(Date())
        //        Appodeal.setUserAge(25)
        //        Appodeal.setUserGender(.male)
        //        Appodeal.setUserOccupation(.work)
        //        Appodeal.setUserRelationship(.searching)
        //        Appodeal.setUserSmokingAttitude(.neutral)
        //        Appodeal.setUserAlcoholAttitude(.neutral)
        //        Appodeal.setUserInterests("skydiving, meditation")
        
        
//        let adTypes: AppodealAdType = [.interstitial, .rewardedVideo, .banner, .MREC]
//        Appodeal.setLogLevel(.off)
//        Appodeal.setAutocache(true, types: adTypes)
//        Appodeal.initialize(withApiKey: kAPP_KEY, types: adTypes)
//    }
    
    // MARK: Config
    
//    func configureAppearance() {
//        let navBarAttributes = [NSAttributedStringKey.foregroundColor: UIColor.clear]
//
//        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//
//        UIBarButtonItem.appearance().setTitleTextAttributes(navBarAttributes, for: .normal)
//        UIBarButtonItem.appearance().setTitleTextAttributes(navBarAttributes, for: .highlighted)
//
//        if #available(iOS 10.0, *) {
//            UITabBar.appearance().unselectedItemTintColor = .lightGray
//        }
//        UITabBar.appearance().tintColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//    }

    // реклама
    
 /*   // MARK: - Core Data stack

    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "____2____")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        if #available(iOS 10.0, *) {
            let context = persistentContainer.viewContext
        } else {
            // Fallback on earlier versions
        }
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
*/
}

