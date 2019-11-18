//
//  UIViewController.swift
//  StatVBL
//
//  Created by Михаил Нечаев on 04/08/2019.
//  Copyright © 2019 Michael Nechaev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showAlert(_ withText: String, _ andDescription: String?) {
        let alert = UIAlertController(title: withText, message: andDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) -> Void in
        })
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(_ withText: String, _ description: String?, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: withText, message: description, preferredStyle: .alert)
        for action in actions {
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func flashAlert(_ withText: String, _ andDescription: String?, withDelay: Double, completion: @escaping(()->())) {
        let alert = UIAlertController(title: withText, message: andDescription, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + withDelay) {
            alert.dismiss(animated: true, completion: nil)
            completion()
        }
    }
    
    static func nibInstance() -> UIViewController? {
        let authorizationVC = Bundle.main.loadNibNamed(nameOfClass, owner: self, options: nil)?.first as? UIViewController
        return authorizationVC
    }
    
    func showTip(with text: String) {
        let tipView = UIView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 60))
        tipView.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 16, y: 8, width: 180, height: 42))
        label.text = text
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        UIApplication.shared.keyWindow?.addSubview(tipView)
        tipView.addSubview(label)
        let button = UIButton(frame: CGRect(x: view.frame.width - 90, y: 8, width: 72, height: 44))
        button.setTitle("OK", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(hideTip(_:)), for: .touchUpInside)
        tipView.addSubview(button)
        UIView.animate(withDuration: 0.6) {
            tipView.frame = CGRect(x: 0, y: self.view.frame.height - 60, width: self.view.frame.width, height: 60)
            UIApplication.shared.keyWindow?.bringSubviewToFront(tipView)
        }
    }
    
    @objc
    fileprivate func hideTip(_ sender: UIButton) {
        if let tipView = sender.superview {
            UIView.animate(withDuration: 0.6, animations: {
                tipView.frame = CGRect(x: 0, y: tipView.frame.maxY + 60, width: tipView.frame.width, height: 60)
            }) { (_) in
                tipView.removeFromSuperview()
            }
        }
    }

}
