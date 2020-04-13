//
//  ViewController.swift
//  DownloadFilesFromUrl
//
//  Created by Himalaya Rajput on 13/04/20.
//  Copyright © 2020 Himalaya Rajput. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: CircularProgressView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressBar.updateProgressBar(forValue: 0.3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.progressBar.updateProgressBar(forValue: 0.5)
        }
    }
   
}

