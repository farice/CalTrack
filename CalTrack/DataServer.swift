//
//  DataServer.swift
//  CalTrack
//
//  Created by Andrew Bihl on 5/27/17.
//  Copyright © 2017 Andrew Bihl. All rights reserved.
//

import Foundation
import CoreLocation
import RealmSwift

class DataServer {
    
    public static let sharedInstance = DataServer()

    var stopTimes: Results<stop_times>?
    
    init() {
        
        let realm = try! Realm()
        self.stopTimes = realm.objects(stop_times.self)//.filter(<#T##predicate: NSPredicate##NSPredicate#>)
        print(self.stopTimes?.count)
        
    }
    
    public func getDepartureTimesForStop(id: Int) -> [Date]{
        return [Date.distantFuture]
    }
    
    
    /// Get all the stops with a particular direction.
    ///
    /// - Parameter headingNorth: If true, get stops with trains heading north toward San Francisco. Otherwise, get stops heading south to San Jose.
    public func getStopLocations(headingNorth: Bool) -> [CLLocationCoordinate2D] {
        var stops = [CLLocationCoordinate2D]()
        for i in 0..<stopIDs.count {
            if (i % 2 == 0) == headingNorth {
                stops.append(CLLocationCoordinate2DMake(stopLatitudes[i], stopLongitudes[i]))
            }
        }
        return stops
    }
    
    public func getAllStops()->[Int:CLLocationCoordinate2D] {
        var stops = Dictionary<Int, CLLocationCoordinate2D>()
        for id in stopIDs {
            stops[id] = CLLocationCoordinate2D.stopCoordinates(id: id)
        }
        return stops
    }
    
}
