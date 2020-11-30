//
//  RestTypesCell.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit
import SkeletonView

class RestTypesCell: UITableViewCell {
    var items: [CircleModel]?{
        didSet {
            collectionView.reloadData()
        }
    }
    var didSelectItem: ( (CircleModel) -> () )?
    let RestTypeCell = "RestTypeCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: RestTypeCell, bundle: nil), forCellWithReuseIdentifier: RestTypeCell)
    }
    
}


extension RestTypesCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = items?[indexPath.row] {
            didSelectItem?(item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.items?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestTypeCell, for: indexPath) as! RestTypeCell
        if(item?.isSelected == true){
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            cell.isSelected = true
        }
        cell.configure(item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items == nil ? 10 : items?.count ?? 0
    }
    
}


extension RestTypesCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - (8 * 4) - 15) / 4.5
        
        return CGSize(width: width, height: width + 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
    }
}
