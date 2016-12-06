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
    var beaconRegion: CLBeaconRegion!
    var closestBeacon: CLBeacon!
    var startDate: Date?
    var endDate: Date?
    var timeSpent: TimeInterval?
    var timer: Timer?
    
    override init(){
        super.init()
    }
    
    func requestAuthorization(){
        beaconManager = CLLocationManager()
        beaconManager.delegate = self
        beaconManager.requestAlwaysAuthorization()
    }
    
    func startMonitoring(){
        let uuid: UUID!
        uuid = UUID(uuidString: "f7826da6-4fa2-4e98-8024-bc5b71e0893e")
        beaconRegion = CLBeaconRegion(proximityUUID: uuid, major: 44087, identifier: "My ID")
        beaconRegion.notifyOnEntry = true
        beaconRegion.notifyOnExit = true
        beaconManager.startUpdatingLocation()
        beaconManager.startMonitoring(for: beaconRegion)
        beaconManager.startRangingBeacons(in: beaconRegion)
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
            for beacon: CLBeacon in beacons {
                if (closestBeacon == nil && beacon.rssi != 0 && beacon.accuracy <= 1.0){
                    closestBeacon = beacon
                    startDate = Date()
                }
                
                if let newBeacon = closestBeacon {
                    if (newBeacon.rssi > beacon.rssi && beacon.rssi != 0){
                        closestBeacon = beacon
                    }
                }
                
            }
            if (closestBeacon != nil){
                print(closestBeacon)
                
                if(closestBeacon.accuracy > 1.0){
                    endDate = Date()
                    
                    timeSpent = endDate?.timeIntervalSince(startDate!)
                    print("You have been sleeping for: \(timeSpent)")
                    closestBeacon = nil
                    endDate = nil
                    startDate = nil
                }
            }
        }
    }
}
