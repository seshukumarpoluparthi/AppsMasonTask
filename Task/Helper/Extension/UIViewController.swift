//
//  UIViewController.swift
//  Task
//
//  Created by Quventix Solutions on 23/12/19.
//  Copyright © 2019 TejinderPaul. All rights reserved.
//

import UIKit

extension UIViewController{
    static var storyboardID:String{
        return String(describing: self)
    }
}

extension UIViewController {
    var activityIndicatorTag: Int { return 999999 }
}

extension UIViewController {
    func startActivityIndicator(
        style: UIActivityIndicatorView.Style = .medium,
        location: CGPoint? = nil) {
        let loc = location ?? self.view.center
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: style)
            activityIndicator.tag = self.activityIndicatorTag
            activityIndicator.center = loc
            activityIndicator.hidesWhenStopped = true
            activityIndicator.startAnimating()
            self.view.addSubview(activityIndicator)
        }
    }
}

extension UIViewController {
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag}).first as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
}
