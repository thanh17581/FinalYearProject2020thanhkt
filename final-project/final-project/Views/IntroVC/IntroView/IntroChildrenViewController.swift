//
//  IntroChildrenViewController.swift
//  ios-photo-vault
//
//  Created by Vinsofts on 10/2/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class IntroChildrenViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var imgData = UIImage()
    var lblTitleData = String()
    var lblDes = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.img.image = imgData
        self.lblTitle.text = lblTitleData
        self.lblDescription.text = lblDes
        
    }
    
}
