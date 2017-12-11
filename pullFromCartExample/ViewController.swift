//
//  ViewController.swift
//  pullFromCartExample
//
//  Created by Nicolas Palmieri on 12/11/17.
//  Copyright © 2017 Nicolas Palmieri. All rights reserved.
//

import UIKit
import baggage_journey

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showMeSomeMagic()
    }

    public func showMeSomeMagic() {
        let controller = BaggageController()
        controller.showThaView()
    }
}

