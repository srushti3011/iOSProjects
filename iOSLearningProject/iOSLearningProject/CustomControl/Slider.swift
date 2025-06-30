//
//  Slider.swift
//  iOSLearningProject
//
//  Created by Srushti Sarju Engineer on 25/06/25.
//
import UIKit

class Slider: UIControl {
    
    // MARK: Instance variables
    var lowerThumb = UIImageView()
    
    var upperThumb = UIImageView()
    
    var track = CALayer()
    
    var trackColor = UIColor.lightGray
    
    var sliderMin = 30.0
    
    var sliderMax = 50.0
    
    var minThumbCurrentValue = 0.0 {
        didSet {
            sendActions(for: .valueChanged)
            print("minThumbCurrentValue = \(minThumbCurrentValue)")
        }
    }
    
    var maxThumbCurrentValue = 1.0 {
        didSet {
            sendActions(for: .valueChanged)
            print("maxThumbCurrentValue = \(maxThumbCurrentValue)")
        }
    }
    
    var minThumbTouchPosition: UITouch?
    
    var maxThumbTouchPosition: UITouch?
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        track.backgroundColor = trackColor.cgColor
        track.cornerRadius = 5
        track.zPosition = 0.0
        layer.addSublayer(track)
        
        lowerThumb.image = UIImage(named: "MinMaxThumb")
        addSubview(lowerThumb)
        
        upperThumb.image = UIImage(named: "MinMaxThumb")
        addSubview(upperThumb)
        track.setNeedsDisplay()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override methods
    override func layoutSubviews() {
        super.layoutSubviews()
        configureTrack()
        updateView()
    }
    
    // MARK: Instance methods
    func configureTrack() {
        let trackFrame = bounds.insetBy(dx: 0.0, dy: bounds.height / 3)
        track.frame = trackFrame
        track.setNeedsDisplay()
    }
    
    func updateView() {
        let thumbSize = CGSize(width: 25, height: 25)
        
        if let minThumbTouchPosition {
            let location = minThumbTouchPosition.location(in: self)
            if location.x <= track.frame.minX {
                lowerThumb.frame = CGRect(x: CGFloat(Int(bounds.minX)), y: track.bounds.midY - (thumbSize.height/2), width: thumbSize.width, height: thumbSize.height)
                lowerThumb.center = CGPoint(x: lowerThumb.center.x, y: lowerThumb.bounds.midY)
                minThumbCurrentValue = sliderMin
            } else if location.x >= upperThumb.frame.minX {
                lowerThumb.frame = upperThumb.frame
                minThumbCurrentValue = maxThumbCurrentValue
            } else {
                lowerThumb.frame = CGRect(x: location.x, y: track.bounds.midY, width: thumbSize.width, height: thumbSize.height)
                lowerThumb.center = CGPoint(x: lowerThumb.center.x, y: lowerThumb.bounds.midY)
                
                let percent = (location.x - track.frame.minX) / (track.frame.maxX - track.frame.minX)
                minThumbCurrentValue = sliderMin + percent * (sliderMax - sliderMin)
            }
        } else {
            lowerThumb.frame = CGRect(x: CGFloat(Int(bounds.minX)), y: track.bounds.midY - (thumbSize.height/2), width: thumbSize.width, height: thumbSize.height)
            lowerThumb.center = CGPoint(x: lowerThumb.center.x, y: lowerThumb.bounds.midY)
            minThumbCurrentValue = sliderMin
        }

        if let maxThumbTouchPosition {
            let location = maxThumbTouchPosition.location(in: self)
            if location.x >= track.frame.maxX {
                upperThumb.frame = CGRect(x: CGFloat(Int(bounds.maxX) - Int(thumbSize.width)), y: track.bounds.midY - (thumbSize.height/2), width: thumbSize.width, height: thumbSize.height)
                upperThumb.center = CGPoint(x: upperThumb.center.x, y: upperThumb.bounds.midY)
                maxThumbCurrentValue = sliderMax
            } else if location.x <= lowerThumb.frame.minX {
                upperThumb.frame = lowerThumb.frame
                maxThumbCurrentValue = minThumbCurrentValue
            } else {
                upperThumb.frame = CGRect(x: location.x, y: track.bounds.midY, width: thumbSize.width, height: thumbSize.height)
                upperThumb.center = CGPoint(x: upperThumb.center.x, y: upperThumb.bounds.midY)
                
                let percent = (location.x - track.frame.minX) / (track.frame.maxX - track.frame.minX)
                maxThumbCurrentValue = sliderMin + percent * (sliderMax - sliderMin)
            }
        } else {
            upperThumb.frame = CGRect(x: CGFloat(Int(bounds.maxX) - Int(thumbSize.width)), y: track.bounds.midY - (thumbSize.height/2), width: thumbSize.width, height: thumbSize.height)
            upperThumb.center = CGPoint(x: upperThumb.center.x, y: upperThumb.bounds.midY)
            maxThumbCurrentValue = sliderMax
        }
    }
}

extension Slider {
    // MARK: Extension - Tracking thumbs
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if lowerThumb.frame.contains(touch.location(in: self)) {
            lowerThumb.isHighlighted = true
            lowerThumb.backgroundColor = UIColor.cyan
        } else if upperThumb.frame.contains(touch.location(in: self)) {
            upperThumb.isHighlighted = true
            upperThumb.backgroundColor = UIColor.cyan
        }
        print(lowerThumb.isHighlighted || upperThumb.isHighlighted)
        return lowerThumb.isHighlighted || upperThumb.isHighlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if lowerThumb.isHighlighted {
            minThumbTouchPosition = touch
        }
        if upperThumb.isHighlighted {
            maxThumbTouchPosition = touch
        }
        setNeedsLayout()
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumb.isHighlighted = false
        lowerThumb.layer.backgroundColor = UIColor.clear.cgColor
        upperThumb.isHighlighted = false
        upperThumb.layer.backgroundColor = UIColor.clear.cgColor
    }
}
