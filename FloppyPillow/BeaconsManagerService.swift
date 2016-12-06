//
//  BeaconsManagerService.swift
//  FloppyPillow
//
//  Created by Mateusz Stelmaszuk on 02.12.2016.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit
import CoreLocation
import KontaktSDK

class BeaconsManagerService: NSObject {

    var beaconManager: KTKBeaconManager!
    
    override init(){
        super.init()
    }
    
    func requestAuthorization(){
        beaconManager = KTKBeaconManager(delegate: self)
        
        switch KTKBeaconManager.locationAuthorizationStatus() {
        case .notDetermined:
            beaconManager?.requestLocationAlwaysAuthorization()
        case .denied, .restricted:
            print("No access")
        case .authorizedWhenInUse:
            beaconManager?.requestLocationWhenInUseAuthorization()
        case .authorizedAlways:
            print("Started monitoring regions")
            startMonitoring()
        }
    }
    
    func startMonitoring(){
        let region: KTKBeaconRegion!
        let uuid: UUID!
        uuid = UUID.init(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")
        region = KTKBeaconRegion(proximityUUID: uuid, major: 44087, identifier: "My Identifier")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        region.notifyEntryStateOnDisplay = true
        beaconManager.startMonitoring(for: region)
        beaconManager.startRangingBeacons(in: region)
    }
}

extension BeaconsManagerService: KTKBeaconManagerDelegate{
    
    func beaconManager(_ manager: KTKBeaconManager, didDetermineState state: CLRegionState, for region: KTKBeaconRegion){
        if (state == .inside){
           self.beaconManager.delegate?.beaconManager!(manager, didEnter: region)
        }else if(state == .outside){
            self.beaconManager.delegate?.beaconManager!(manager, didExitRegion: region)
        }
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didEnter region: KTKBeaconRegion) {
        print("did enter region: \(region.identifier)")
        beaconManager.startRangingBeacons(in: region)
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didExitRegion region: KTKBeaconRegion) {
        print("did exit region: \(region.identifier)")
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didRangeBeacons beacons: [CLBeacon], in region: KTKBeaconRegion) {
        print("did range beacons: \(beacons)")
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didChangeLocationAuthorizationStatus status: CLAuthorizationStatus) {
        startMonitoring()
    }
    
    func beaconManager(_ manager: KTKBeaconManager, didStartMonitoringFor region: KTKBeaconRegion) {
        manager.requestState(for: region)
    }
    
}
