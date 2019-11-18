//
//  RadialMenu.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 28.10.2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

@IBDesignable
final class RadialMenu: UIView {
    
    // MARK: - Enums
    
    struct ItemSettings {
        let action: (()->Void)
        let title: String
    }
    
    private enum Constants {
        static let scale: CGFloat = 3
        static let itemFactor: CGFloat = 0.71
    }

    private enum Fonts {
        static let main: UIFont = UIFont.systemFont(ofSize: 24, weight: .semibold)
        static let item: UIFont = UIFont.systemFont(ofSize: 21, weight: .semibold)
    }
    
    // MARK: - Internal properties
    
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
    private var menuBaseView: UIView?
    private var menuItems = [AnimatedBorderView]()
    private var selectedItem: AnimatedBorderView?
    
    private var startPoint: CGFloat = .pi
    private var arcLength: CGFloat = .pi / 2
    private var startPositions = [CGPoint]()
    
    // MARK: - Computed properties
    
    private var menuBaseViewRaidus: CGFloat {
        return frame.width * Constants.scale / 2
    }

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

// MARK: - Configure items

extension RadialMenu {
    
    func setItems(with settings: [ItemSettings]) {
        for setting in settings {
            let view = AnimatedBorderView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            view.title = setting.title
            view.action = setting.action
            view.backgroundColor = .white //green
            view.isHidden = true
            addSubview(view)
            menuItems.append(view)
            view.layer.cornerRadius = view.frame.width / 2
        }
        reloadItemsPositions()
    }
    
    func setStartingPositions(_ startPoint: CGFloat = .pi, arcLength: CGFloat = .pi / 2) {
        self.startPoint = startPoint
        self.arcLength = arcLength
        reloadItemsPositions()
    }
    
    private func reloadItemsPositions() {
        startPositions = [CGPoint]()
        for item in menuItems.enumerated() {
            let segments = CGFloat(menuItems.count > 1 ? menuItems.count - 1 : 1)
            let angle = startPoint - CGFloat(item.offset) * (arcLength / segments)
            //plus on x coordinate, because it matches to decartes coordinate system with ios coordinates
            //minus on y coordinate, because it opposite to decartes coordinate system with ios coordinates
            let itemOrigin = CGPoint(x: bounds.midX + menuBaseViewRaidus * cos(angle), y: bounds.midY - menuBaseViewRaidus * sin(angle))
            startPositions.append(itemOrigin)
        }
    }

}

// MARK: - Setup UI

private extension RadialMenu {
    
    func commonInit() {
        addLongPress()
        addLabel()
        addImage()
        addMenuBaseView()
    }
    
    func addLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        label.textColor = .white
        label.textAlignment = .center
        label.font = Fonts.main
        label.backgroundColor = .clear
        titleLabel = label
        addSubview(label)
    }

    func addImage() {
        let imgaeView = UIImageView(frame: CGRect(x: 8, y: 8, width: bounds.width-16, height: bounds.height-16))
//        imgaeView.tintColor = .white
        imgaeView.backgroundColor = .clear//UIColor.blue.withAlphaComponent(0.2)//.white
        imageView = imgaeView
        imageView?.layer.cornerRadius = (imageView?.frame.width ?? 0) / 2
        addSubview(imgaeView)
    }
    
    func addMenuBaseView() {
        let baseView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        baseView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        baseView.layer.cornerRadius = baseView.frame.width / 2
        menuBaseView = baseView
        baseView.isHidden = true
        addSubview(baseView)
    }

    @objc
    func handlePress(_ sender: UILongPressGestureRecognizer) {
        switch sender.state {
        case .began:
            superview?.bringSubviewToFront(self)
            showMenu()
        case .changed:
            menuItemShouldChange(with: sender.location(in: self))
        case .cancelled, .ended, .failed:
            hideMenu()
            guard let unwrappedAction = selectedItem?.action else {
                return
            }
            unwrappedAction()
            animateChoice()
        case .possible:
            break
        @unknown default:
            return
        }
    }

}

// MARK: - Drawing states

private extension RadialMenu {
    
    func showMenu() {
        menuBaseView?.isHidden = false
        UIView.animate(withDuration: 0.2) {
            let scale = CGAffineTransform(scaleX: Constants.scale, y: Constants.scale)
            self.menuBaseView?.transform = scale
            for item in self.menuItems.enumerated() {
                item.element.center = self.startPositions[item.offset]
                item.element.isHidden = false
            }
        }
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.1, animations: {
            let scale = CGAffineTransform(scaleX: 1, y: 1)
            self.menuBaseView?.transform = scale
            for item in self.menuItems.enumerated() {
                item.element.stopAnimations()
                item.element.center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
            }
        }) { _ in
            self.menuBaseView?.isHidden = true
            for item in self.menuItems.enumerated() {
                item.element.isHidden = true
            }
        }
    }
    
    func animateChoice() {
        let title = selectedItem?.title
        let label = UILabel(frame: bounds)
        label.backgroundColor = .clear
        label.text = title
        label.textAlignment = .center
        label.textColor = .yellow
        label.font = UIFont.systemFont(ofSize: frame.width / 2, weight: .medium)
        addSubview(label)
        label.alpha = 1
        UIView.animate(withDuration: 2) {
            label.frame = CGRect(x: 0, y: -150, width: label.frame.width, height: label.frame.height)
            label.alpha = 0
        }
        
        selectedItem = nil
    }

}

// MARK: - Setup gestures

private extension RadialMenu {

    func addLongPress() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handlePress(_:)))
        longPress.minimumPressDuration = 0.1
        addGestureRecognizer(longPress)
    }

}

// MARK: - Helpers

private extension RadialMenu {
    
    func menuItemShouldChange(with location: CGPoint) {
        for item in menuItems {
            if item.frame.contains(location) {
                if item != selectedItem {
                    selectedItem?.stopAnimations()
                    item.animate()
                    selectedItem = item
                    return
                } else if item == selectedItem {
                    return
                }
            }
        }
        selectedItem?.stopAnimations()
        selectedItem = nil
    }

}
