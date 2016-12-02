//
//  ApplicationAssembly.swift
//  FloppyPillow
//
//  Created by Michał Karpowicz on 02/12/16.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import Foundation
import Typhoon

class ApplicationAssembly : TyphoonAssembly {
    
    var workflowAssembly: WorkflowAssembly!
    
    dynamic func appDelegate() -> Any {
        return TyphoonDefinition.withClass(AppDelegate.self) { [unowned self]
            definition in
            definition?.injectProperty(#selector(getter: AppDelegate.applicationWorkflow), with: self.workflowAssembly.applicationWorkflow())
        }
    }
    
}
