//
//  WorkflowAssembly.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 02/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation
import Typhoon

class WorkflowAssembly : TyphoonAssembly {
    
    var viewControllerAssembly: ViewControllerAssembly!
    
    dynamic func applicationWorkflow() -> Any {
        return TyphoonDefinition.withClass(ApplicationWorkflow.self) { [unowned self]
            definition in
            definition?.injectProperty(#selector(getter: ApplicationWorkflow.viewControllerAssembly), with: self.viewControllerAssembly)
        }
    }
    
}
