//
//  MainViewController.swift
//  BeaconPillow
//
//  Created by Michał Karpowicz on 30/11/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    var locationManager: BeaconsManagerSession!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        locationManager?.beaconsService.requestAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
