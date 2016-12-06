//
//  BeaconsNativeService.swift
//  FloppyPillow
//
//  Created by Mateusz Stelmaszuk on 06.12.2016.
//  Copyright © 2016 SoftwareHut. All rights reserved.
//

import UIKit
import CoreLocation

class BeaconsNativeService: NSObject {
    var beaconManager: CLLocationManager!
    
    override init(){
        super.init()
    }
    
    func requestAuthorization(){
        beaconManager = CLLocationManager()
        beaconManager.delegate = self
        beaconManager.requestAlwaysAuthorization()
    }
    
    func startMonitoring(){
        let region: CLBeaconRegion!
        let uuid: UUID!
        uuid = UUID(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")
        region = CLBeaconRegion(proximityUUID: uuid, major: 44087, identifier: "My ID")
        region.notifyOnEntry = true
        region.notifyOnExit = true
        beaconManager.startUpdatingLocation()
        beaconManager.startMonitoring(for: region)
        beaconManager.startRangingBeacons(in: region)
    }
}

extension BeaconsNativeService: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        startMonitoring()
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            var closestBeacon: CLBeacon!
            for beacon: CLBeacon in beacons {
                if closestBeacon == nil{
                    closestBeacon = beacon
                }
                
                if (closestBeacon.rssi > beacon.rssi && beacon.rssi != 0){
                    closestBeacon = beacon
                }
            }
            
            print(closestBeacon)
        }
    }
}
