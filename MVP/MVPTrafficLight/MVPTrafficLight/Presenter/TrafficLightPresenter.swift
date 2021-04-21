//
//  TrafficLightPresenter.swift
//  MVPTrafficLight
//
//  Created by Robert Barney on 3/4/21.
//  Copyright © 2021 App Dog Inc. All rights reserved.
//

import Foundation

class TrafficLightPresenter {
    
    private let trafficLightService: TrafficLightService
    weak private var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService: TrafficLightService) {
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName:(String)) {
        trafficLightService.getTrafficLight(colorName: colorName) { [weak self] traficLight in
            if let traficLight = traficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(description: traficLight.description)
            }
        }
    }
}
