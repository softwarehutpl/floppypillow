//
//  ServiceAssembly.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 02/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation
import Typhoon

class ServiceAssembly : TyphoonAssembly {
    dynamic func beaconsManagerService() -> Any {
        return TyphoonDefinition.withClass(BeaconsManagerService.self) {
            definition in
        }
    }
    
    dynamic func beaconsNativeService() -> Any {
        return TyphoonDefinition.withClass(BeaconsNativeService.self) {
            definition in
        }
    }
}
