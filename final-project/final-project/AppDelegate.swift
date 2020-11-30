//
//  AppDelegate.swift
//  final-project
//
//  Created by Vinsofts on 11/10/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Toast_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = IntroVC()
        let Nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = Nav
        window?.makeKeyAndVisible()
        
        IQKeyboardManager.shared.enable = true
        
        var TStyle: ToastStyle {
            var style = ToastStyle()
            style.messageColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 1, alpha: 1)
            style.titleColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            style.backgroundColor = #colorLiteral(red: 1, green: 0.3411764706, blue: 0.3882352941, alpha: 0.5)
            style.messageAlignment = .center
            style.titleAlignment = .center
            style.horizontalPadding = 20
            
            return style
        }
        
        ToastManager.shared.style = TStyle
        
        return true
    }
}

