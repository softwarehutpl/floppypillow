//
//  BeaconsManagerService.swift
//  FloppyPillow
//
//  Created by Mateusz Stelmaszuk on 02.12.2016.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit
import CoreLocation

class BeaconsManagerService: NSObject {

    var beaconManager: CLLocationManager!
    
    override init(){
        super.init()
    }
    
    func requestAuthorization(){
        beaconManager = CLLocationManager.init()
        beaconManager.delegate = self
        beaconManager.requestAlwaysAuthorization()
    }
    
    func startMonitoring(){
        let region: CLBeaconRegion!
        let region2: CLRegion!
        let uuid: UUID!
        uuid = UUID(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")
        region = CLBeaconRegion(proximityUUID: uuid, major: 64681, identifier: "My Identifier")
        beaconManager.startUpdatingLocation()
        beaconManager.startMonitoring(for: region)
//        beaconManager.startRangingBeacons(in: region)
    }
}

extension BeaconsManagerService: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("did enter region: \(region.identifier)")
        beaconManager.startRangingBeacons(in: region as! CLBeaconRegion)
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("did exit region: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        print("did range beacons: \(beacons)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        startMonitoring()
    }
}
