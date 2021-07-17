//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 27.06.2021.
//

import UIKit

var liveApp: Bool = false

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //загрузка завершилась
        applicationLive(from: "Not running", to: "Inactive")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        applicationLive(from: "Inactive", to: "Acrive")
        //стало активным
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        applicationLive(from: "Acrive", to: "Inactive")
        //собирается стать не активным
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        applicationLive(from: "Inactive", to: "Backround")
        //стало не активным
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        applicationLive(from: "Backround", to: "Inactive")
        // собирается вернуться в активное
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        applicationLive(from: "Backround", to: "Suspend")
        //завершил работу
    }
    
    func applicationLive(from: String, to: String, applicationFunc: String = #function) {
        if liveApp == true {
            print("Application moved from <\(from)> to <\(to)>, \(applicationFunc)")
        }
    }
}

