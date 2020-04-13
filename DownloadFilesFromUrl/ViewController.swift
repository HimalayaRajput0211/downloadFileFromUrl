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
    
    private var filePaths = [String]()
    @IBOutlet private weak var urlTextField: UITextField!
    @IBOutlet private weak var downloadFileButton: UIButton!
    @IBOutlet private weak var progressBar: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let paths = UserDefaults.standard.object(forKey: PersistenceKey.savedFileUrls) as? [String] {
            filePaths = paths
        }
    }
    
    @IBAction func downloadFile(_ sender: UIButton) {
        guard let urlString = urlTextField.text else { return }
        progressBar.updateProgressBar(forValue: 0.0)
        downloadFileButton.isEnabled = false
        downloadFileFromString(urlString)
    }
    
    private func downloadFileFromString(_ urlString: String) {
        guard let url = URL(string: urlString) else { return }
        AF.download(url).response { (response) in
            switch response.result {
            case .success(let fileUrl):
                guard let filePath = fileUrl?.path else { return }
                self.filePaths.append(filePath)
                UserDefaults.standard.set(self.filePaths, forKey: PersistenceKey.savedFileUrls)
            case .failure(let error): print(error)
            }
            self.downloadFileButton.isEnabled = true
        }.downloadProgress { progress in
            self.progressBar.updateProgressBar(forValue: CGFloat(progress.fractionCompleted))
        }
    }
    
}

struct PersistenceKey {
    static let savedFileUrls = "saved_file_urls"
}
