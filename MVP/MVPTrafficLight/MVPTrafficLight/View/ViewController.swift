//
//  ViewController.swift
//  MVPTrafficLight
//
//  Created by Robert Barney on 3/2/21.
//  Copyright © 2021 App Dog Inc. All rights reserved.
//

import UIKit

protocol TrafficLightViewDelegate: class {
    func displayTrafficLight(description:(String))
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }

    @IBAction func redTapped(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Red")
    }
    
    
    @IBAction func yelloeTapped(_ sender: Any) {
         trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
    }
    
    
    @IBAction func greeenTapped(_ sender: Any) {
         trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
    }
}

extension ViewController: TrafficLightViewDelegate {
    
    func displayTrafficLight(description: (String)) {
        label.text = description
    }
}



