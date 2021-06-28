//
//  AppDelegate.swift
//  TinkoffChat
//
//  Created by Александр Джегутанов on 27.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //загрузка завершилась
        LifeCycleApp.shared.printLife("\(#function): загрузка завершилась")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        LifeCycleApp.shared.printLife("\(#function): стало активным")
        //стало активным
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        LifeCycleApp.shared.printLife("\(#function): собирается стать не активным")
        //собирается стать не активным
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        LifeCycleApp.shared.printLife("\(#function): стало не активным")
        //стало не активным
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        LifeCycleApp.shared.printLife("\(#function): собирается вернуться в активное")
        // собирается вернуться в активное
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        LifeCycleApp.shared.printLife("\(#function): завершил работу")
        //завершил работу
    }
    
}

