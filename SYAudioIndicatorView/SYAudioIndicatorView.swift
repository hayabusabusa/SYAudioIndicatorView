//
//  SYAudioIndicatorView.swift
//  AudioIndicatorTest
//
//  Created by Yamada Shunya on 2019/03/22.
//  Copyright © 2019 Yamada Shunya. All rights reserved.
//

import UIKit

@IBDesignable
class SYAudioIndicatorView: UIView {
    
    // IBInspectable
    @IBInspectable var barCount: Int = 5
    @IBInspectable var barSpace: CGFloat = 4.0
    @IBInspectable var barCornerRadius: CGFloat = 0
    @IBInspectable var barColor: UIColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1)
    @IBInspectable var barAnimationDuration: Double = 0.8
    
    // Layer
    private var barLayers: [CALayer]!
    
    // Animation
    private var startTransforms: [CABasicAnimation]!
    private var stopTransform: CABasicAnimation!
    
    // State
    enum BarState: Int {
        case animating
        case stopped
    }
    public private(set) var barState: BarState = .stopped
    
    // Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
        setupLayers()
        setupAnimations()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        commonInit()
        setupLayers()
        setupAnimations()
    }
    
    // Initializer
    private func commonInit() {
        // Don`t set false.
        clipsToBounds = true
    }
    
    private func setupLayers() {
        barLayers = [CALayer]()
        
        let barArea = frame.width / CGFloat(barCount)
        let barWidth = barArea - barSpace
        
        for i in 0..<barCount {
            let barPosition = (barArea / 2) + (barArea * CGFloat(i))
            
            let bar = CALayer()
            bar.bounds = CGRect(x: 0, y: 0, width: barWidth, height: frame.height / 4)
            bar.position = CGPoint(x: barPosition, y: frame.height)
            bar.cornerRadius = barCornerRadius
            bar.backgroundColor = barColor.cgColor
            layer.addSublayer(bar)
            barLayers.append(bar)
        }
    }
    
    private func setupAnimations() {
        startTransforms = [CABasicAnimation]()
        
        // Stop
        stopTransform = CABasicAnimation(keyPath: "transform.scale.y")
        stopTransform.fillMode = .forwards
        stopTransform.isRemovedOnCompletion = false
        stopTransform.duration = barAnimationDuration
        stopTransform.toValue = 1.0
        stopTransform.speed = 2.0
        
        for _ in 0..<barCount {
            // Start
            let startTransform = CABasicAnimation(keyPath: "transform.scale.y")
            startTransform.autoreverses = true
            startTransform.repeatCount = Float.infinity
            startTransform.fillMode = .forwards
            startTransform.isRemovedOnCompletion = false
            startTransform.duration = barAnimationDuration
            startTransform.fromValue = 1.0
            startTransform.toValue = Float.random(in: 1.5 ..< 8) // rand 1.5 ~ 8
            startTransform.speed = Float.random(in: 1 ..< 2) // rand 1 ~ 2
            startTransform.timingFunction = CAMediaTimingFunction(name: .easeIn)
            startTransforms.append(startTransform)
        }
    }
    
    /// Setup bar and animations.
    /// If you set view programmatically, run this method !!
    public func setupBars() {
        setupLayers()
        setupAnimations()
    }
    
    // Animation start, stop
    public func start() {
        guard barState == .stopped else { return }
        barState = .animating
        for i in 0..<barCount {
            barLayers[i].add(startTransforms[i], forKey: "startTransform")
        }
    }
    
    public func stop() {
        guard barState == .animating else { return }
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            self.barState = .stopped
            for i in 0..<self.barCount {
                self.barLayers[i].removeAllAnimations()
            }
        }
        
        for i in 0..<barCount {
            barLayers[i].add(stopTransform, forKey: "stopTransform")
        }
        
        CATransaction.commit()
    }
}
