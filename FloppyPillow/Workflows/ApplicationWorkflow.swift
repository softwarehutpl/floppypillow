//
//  ApplicationWorkflow.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 02/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit

class ApplicationWorkflow : NSObject {
    
    var viewControllerAssembly: ViewControllerAssembly!
    
    func startApp() -> UIWindow{
        print("start app")
        
        // Initialization of initial window, perform app specific customization here
        let window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController: UIViewController
        
        initialViewController = viewControllerAssembly.mainViewController() as! UIViewController
        
        let navController = UINavigationController(rootViewController: initialViewController)
        window.rootViewController = navController
        
        return window
    }
    
}
