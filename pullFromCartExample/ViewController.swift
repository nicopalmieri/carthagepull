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
    let controller = BaggageController()

    override func viewDidLoad() {
        super.viewDidLoad()
        showMeSomeMagic()
    }

    public func showMeSomeMagic() {
        controller.showThaView()
    }

    @IBAction func pushTapped(_ sender: Any) {
        let magic = controller.createView()
        self.navigationController?.pushViewController(magic, animated: true)
    }
}
