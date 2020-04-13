//
//  CircularProgressView.swift
//  DownloadFilesFromUrl
//
//  Created by Himalaya Rajput on 13/04/20.
//  Copyright © 2020 Himalaya Rajput. All rights reserved.
//

import UIKit

class CircularProgressView: UIView {

    private let circularLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }
    private func createCircularPath() {
        let progressViewWidth = frame.size.width
        let progressViewheight = frame.size.height
        let arcCenter = CGPoint(x: progressViewWidth/2, y: progressViewheight/2)
        let radius = min(progressViewWidth, progressViewheight) / 2
        let stratAngle = CGFloat(-0.5 * .pi)
        let endAngle = CGFloat(1.5 * .pi)
        let circularPath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: stratAngle, endAngle:  endAngle, clockwise: true)
        circularLayer.path = circularPath.cgPath
        circularLayer.fillColor = UIColor.clear.cgColor
        circularLayer.strokeColor = UIColor.lightGray.cgColor
        circularLayer.lineCap = .round
        circularLayer.lineWidth = 15
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.darkGray.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 15
        progressLayer.strokeEnd = 0
        layer.addSublayer(circularLayer)
        layer.addSublayer(progressLayer)
    }
    
    func updateProgressBar(forValue value: CGFloat) {
        progressLayer.strokeEnd = value
    }

}
