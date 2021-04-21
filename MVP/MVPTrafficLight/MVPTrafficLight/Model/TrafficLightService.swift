//
//  TrafficLightService.swift
//  MVPTrafficLight
//
//  Created by Robert Barney on 3/2/21.
//  Copyright © 2021 App Dog Inc. All rights reserved.
//

import Foundation

struct TrafficLightService {
    
    func getTrafficLight(colorName:(String), callBack:(TrafficLight?) -> Void) {
        let trafficLights = [TrafficLight(color: "Red", description: "Stop"),
                              TrafficLight(color: "Green", description: "Go"),
                              TrafficLight(color: "Yellow", description: "About to change to red")
         ]
         
         if let foundTrafficLight = trafficLights.first(where: {$0.color == colorName}) {
             callBack(foundTrafficLight)
         } else {
             callBack(nil)
         }
     }
}
