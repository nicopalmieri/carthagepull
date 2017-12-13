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
    let manager = BaggageController()

    override func viewDidLoad() {
        super.viewDidLoad()
        showMeSomeMagic()
    }

    public func showMeSomeMagic() {
        manager.showThaView()
    }

    @IBAction func pushTapped(_ sender: Any) {

        let bundle1 = Bundle(for: BaseController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle1)
        let controller = storyboard.instantiateViewController(withIdentifier: "BaseController") as! BaseController

        self.navigationController?.pushViewController(controller, animated: true)
    }
}
