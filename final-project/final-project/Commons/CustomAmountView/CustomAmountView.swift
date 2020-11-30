//
//  CustomAmountView.swift
//  final-project
//
//  Created by Vinsofts on 11/16/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class CustomAmountView: UIView {
    
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet var contentView: CustomAmountView!
    
    enum AmountViewItems : Int{
        case plus
        case minus
    }
    
    var count = 0 {
        didSet{
            lblAmount.text = "\(count)"
        }
    }
    
    var didPressOnButton: ( (AmountViewItems) -> Void )?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        lblAmount.text = "\(count)"
    }
    
    func validate() -> Bool {
        if(count < 0){
            return false
        } else {
            return true
        }
    }
    
    func commonInit(){
        guard let nibView = Bundle.main.loadNibNamed("CustomAmountView", owner: self, options: nil)?.first as? UIView else { return }
        nibView.frame = self.bounds
        self.addSubview(nibView)
        contentView = nibView as? CustomAmountView
    }
    
    @IBAction func OnBtnPlusAmountTapped(_ sender: Any) {
        if let tappedBtn = AmountViewItems(rawValue: (sender as AnyObject).tag) {
            switch tappedBtn {
            case .plus:
                count += 1
                didPressOnButton?(tappedBtn)
            case .minus:
                break
            }
        }
    }
    @IBAction func OnBtnMinusAmountTapped(_ sender: Any) {
        if let tappedBtn = AmountViewItems(rawValue: (sender as AnyObject).tag) {
            switch tappedBtn {
            case .plus:
                break
            case .minus:
                count > 0 ? count -= 1 : nil
                didPressOnButton?(tappedBtn)
            }
        }
    }
    
}
