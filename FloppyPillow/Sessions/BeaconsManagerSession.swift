//
//  BeaconsManagerSession.swift
//  FloppyPillow
//
//  Created by Mateusz Stelmaszuk on 05.12.2016.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit

class BeaconsManagerSession: NSObject {
    let beaconsService: BeaconsManagerService!
    let nativeService: BeaconsNativeService!
    
    init(service: BeaconsManagerService, nativeBeaconsService: BeaconsNativeService){
        beaconsService = service
        nativeService = nativeBeaconsService
    }
}
