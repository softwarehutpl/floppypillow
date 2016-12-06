//
//  SessionAssembly.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 02/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation
import Typhoon

class SessionAssembly : TyphoonAssembly {
    var serviceAssembly: ServiceAssembly!
    
    dynamic func beaconsManagerSession() -> Any{
        return TyphoonDefinition.withClass(BeaconsManagerSession.self){
            definition in
            definition?.useInitializer(#selector(BeaconsManagerSession.init(service:nativeBeaconsService:))){ [unowned self]
                initializer in
                initializer?.injectParameter(with: self.serviceAssembly.beaconsManagerService())
                initializer?.injectParameter(with: self.serviceAssembly.beaconsNativeService())
           }
            definition?.scope = TyphoonScope.singleton
        }
    }
}
