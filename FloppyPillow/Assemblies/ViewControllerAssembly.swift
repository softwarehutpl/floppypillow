//
//  ViewControllerAssembly.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 02/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation
import Typhoon

class ViewControllerAssembly : TyphoonAssembly {
    
    var serviceAssembly: ServiceAssembly!
    var sessionAssembly: SessionAssembly!
    
    dynamic func mainViewController() -> Any{
        return TyphoonDefinition.withClass(MainViewController.self){ [unowned self]
            definition in
            definition?.useInitializer(#selector(UIViewController.init(nibName:bundle:))){
                initializer in
                initializer?.injectParameter(with: "MainViewController")
                initializer?.injectParameter(with: Bundle.main)
            }
            definition?.injectProperty(#selector(getter: MainViewController.locationManager), with: self.sessionAssembly.beaconsManagerSession())
        }
    }
}
