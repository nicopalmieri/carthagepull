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
    let manager = Baggage()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pushTapped(_ sender: Any) {
        let controller = manager.getControllerBy(identifier: "LoginController")
        navigationController?.pushViewController(controller, animated: true)
    }
}
