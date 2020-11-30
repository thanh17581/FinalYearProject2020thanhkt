//
//  UIPageViewControllerExtension.swift
//  final-project
//
//  Created by Vinsofts on 11/10/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

extension UIPageViewController {

    func enableSwipeGesture() {
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = true
            }
        }
    }
    func disableSwipeGesture() {
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}
