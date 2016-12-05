//
//  AppDelegate.swift
//  BeaconPillow
//
//  Created by Michał Karpowicz on 30/11/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationWorkflow: ApplicationWorkflow!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MainViewController(nibName: "MainViewController", bundle: Bundle.main)
        let navController = UINavigationController(rootViewController: viewController)
        window = applicationWorkflow.startApp()
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
