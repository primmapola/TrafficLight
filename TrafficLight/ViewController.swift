//
//  ViewController.swift
//  TrafficLight
//
//  Created by Grigory Don on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {
    enum CurrentLight {
        case red, yellow, green
    }

    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn:CGFloat = 1.0
    private let lightIsOff:CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
    }
    
    override func viewWillLayoutSubviews() {
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = redLight.frame.width / 2
        greenLight.layer.cornerRadius = redLight.frame.width / 2
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.setTitle("next", for: .normal)
        switch currentLight {
        case .red:
            redLight.alpha = lightIsOn
            greenLight.alpha = lightIsOff
            currentLight = .yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLight.alpha = lightIsOn
            yellowLight.alpha = lightIsOff
            currentLight = .red
        }
    
    }
}

