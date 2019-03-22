//
//  ViewController.swift
//  SYAudioIndicatorView
//
//  Created by Yamada Shunya on 2019/03/22.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var audioIndicator: SYAudioIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapButton(_ sender: Any) {
        if audioIndicator.barState == .stopped {
            audioIndicator.start()
        } else {
            audioIndicator.stop()
        }
    }
}

