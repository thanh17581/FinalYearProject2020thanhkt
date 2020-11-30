//
//  RestaurantDetailHeaderCell.swift
//  final-project
//
//  Created by Vinsofts on 11/18/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderCell: UITableViewHeaderFooterView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblDeliveriTime: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblRatingCount: UILabel!
    
    var GenreCollectionViewCell = "GenreCollectionViewCell"
    var items: [String] = ["Seafood", "Seafood", "Seafood"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: GenreCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: GenreCollectionViewCell)
    }
}

extension RestaurantDetailHeaderCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell, for: indexPath) as! GenreCollectionViewCell
        cell.lblTitle.text = items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.row]
        let size = item.size(withAttributes: [NSAttributedString.Key.font: lblTitle.font!])
        return CGSize(width: size.width + 12, height: 30)
    }
    
    
}
