//
//  ViewController.swift
//  Speedometer
//
//  Created by Joshua Dubey on 14/08/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speedView: SpeedView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speedView.arcColor = .red
        speedView.setNeedsDisplay()
    }

    override func viewDidAppear(_ animated: Bool) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

