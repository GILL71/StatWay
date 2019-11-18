//
//  AnimatedBorderView.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 28.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

@IBDesignable
final class AnimatedBorderView: UIView {
    
    // MARK - Enums
    
    private enum Constants {
        static let lineAnimation = "line"
        static let dottsAnimation = "dots"
        static let strokesAnimation = "strokes"
        static let numberOfArcs = 3
    }
    
    private enum Fonts {
        static let main: UIFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
    }
    
    // MARK: - Public properties
    
    var action: (()->Void)?
    
    @IBInspectable var title: String? {
        didSet {
            titleLabel?.text = title
            imageView?.isHidden = true
            titleLabel?.isHidden = false
        }
    }
    
    @IBInspectable var image: UIImage? {
        didSet {
            imageView?.image = image
            titleLabel?.isHidden = true
            imageView?.isHidden = false
        }
    }
    
    // MARK: - Private properties
    
    private var titleLabel: UILabel?
    private var imageView: UIImageView?
    private var movingView: UIView?
    private var arcShapeLayers = [CAShapeLayer]()

    private var mainLayer = CALayer()
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(frame: CGRect, title: String) {
        self.init(frame: frame)
        self.title = title
        
    }
    
    convenience init(frame: CGRect, image: UIImage) {
        self.init(frame: frame)
        self.image = image
    }

}

// MARK: - Setup UI

private extension AnimatedBorderView {
    
    func commonInit() {
        addLabel()
        addImage()
        addMovingView()
        addArcShapes()
    }
    
    func addLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        label.textColor = .blue
        label.textAlignment = .center
        label.font = Fonts.main
        label.backgroundColor = .clear
        titleLabel = label
        addSubview(label)
    }
    
    func addImage() {
        let imgaeView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        imgaeView.tintColor = .white
        imageView = imgaeView
        addSubview(imgaeView)
    }
    
    func addMovingView() {
//        movingView = UIView(frame: bounds)
//        movingView?.backgroundColor = .clear
//        addSubview(movingView!)
    }
    
    func addArcShapes() {
        let mainLayer = CALayer()
        
        let refreshRadius = frame.size.height / 2
        let arcLength: CGFloat = CGFloat(2) * .pi / CGFloat(Constants.numberOfArcs + 1)
        let spaceLength: CGFloat = arcLength / CGFloat(Constants.numberOfArcs)
        var currentAngle: CGFloat = 0
        for _ in 0..<Constants.numberOfArcs {
            let arc = CAShapeLayer()
            arc.strokeColor = UIColor.blue.cgColor //red
            arc.fillColor = UIColor.clear.cgColor
            arc.lineWidth = 4.0
            let startAngle = currentAngle + spaceLength
            let endAngle = startAngle + arcLength
            currentAngle = endAngle
            arc.path = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: refreshRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true).cgPath
            mainLayer.addSublayer(arc)
            arcShapeLayers.append(arc)
        }
        
        mainLayer.bounds = bounds
        
        mainLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mainLayer.contentsGravity = .center
        mainLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        
        layer.addSublayer(mainLayer)
        self.mainLayer = mainLayer
    }

}

// MARK: - Actions

extension AnimatedBorderView {
    
    func animate() {
//        rotateView(targetView: movingView!)
        rotateLayer()
    }
    
    func stopAnimations() {
        mainLayer.removeAllAnimations()
    }
    
}

// MARK: - Animations samples

private extension AnimatedBorderView {

    func rotateLayer() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Float(.pi * 12.0)
        rotationAnimation.duration = 2.0
        rotationAnimation.repeatCount = Float.infinity
        
        mainLayer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    func rotateView(targetView: UIView, duration: Double = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: .pi)
        }) { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }

}
