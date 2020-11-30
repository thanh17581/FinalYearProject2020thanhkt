//
//  RestaurantTableViewCell.swift
//  final-project
//
//  Created by Vinsofts on 11/17/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

protocol LoveRestaurantDelegate: class {
    func loveRestaurant(rest: dataR)
    func disLoveRestaurant(rest: dataR)
}

class RestaurantTableViewCell: BaseTableViewCell {

    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var resTitle: UILabel!
    @IBOutlet weak var resRating: UILabel!
    @IBOutlet weak var resRatingCount: UILabel!
    @IBOutlet weak var resDeliveryTime: UILabel!
    @IBOutlet weak var BtnLoveRes: UIButton!
    @IBOutlet weak var FoodGenreCollectionView: UICollectionView!
    @IBOutlet weak var collectionFlow: UICollectionViewFlowLayout! {
        didSet {
            collectionFlow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    let genreFont = UIFont.systemFont(ofSize: 12, weight: .bold)
    let GenreCollectionViewCell = "GenreCollectionViewCell"
    var genres = [String]()
    var item: dataR?
    weak var delegate: LoveRestaurantDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        FoodGenreCollectionView.delegate = self
        FoodGenreCollectionView.dataSource = self
        FoodGenreCollectionView.register(UINib(nibName: GenreCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: GenreCollectionViewCell)
        selectionStyle = .none
        FoodGenreCollectionView.translatesAutoresizingMaskIntoConstraints = false
        FoodGenreCollectionView.heightAnchor.constraint(equalToConstant: "GenreTextForHeight".heightOfString(usingFont: genreFont) + 22).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ item: dataR?){
        guard let item = item else { return }
        self.item = item
        resTitle.text = item.name
        resDeliveryTime.text = item.deliveryTime
        resRating.text = "\(item.rating!)"
        resRatingCount.text = "\(item.ratingCount!)"
        BtnLoveRes.imageView?.image = item.liked ?  #imageLiteral(resourceName: "liked") : #imageLiteral(resourceName: "like")
        resImage.image = nil
        if let image = item.image {
            resImage.kf.setImage(with: URL(string: image))
        }
        
        genres = item.genres 
        
        if genres.count == 1 {
            let width = genres[0].widthOfString(usingFont: genreFont)
            FoodGenreCollectionView.widthAnchor.constraint(equalToConstant: width + 22).isActive = true
            resRatingCount.isHidden = false
        } else if genres.count == 2 {
            let width = genres[0...1].map{ $0.widthOfString(usingFont: genreFont) }.reduce(0, +)
            FoodGenreCollectionView.widthAnchor.constraint(equalToConstant: width + 34).isActive = true
            resRatingCount.isHidden = true
        } else if genres.count > 2 {
            let width = genres[0...2].map{ $0.widthOfString(usingFont: genreFont) }.reduce(0, +)
            FoodGenreCollectionView.widthAnchor.constraint(equalToConstant: width + 40).isActive = true
            resRatingCount.isHidden = true
        }
        FoodGenreCollectionView.reloadData()
    }
    
    func bgColor(_ color: UIColor) {
        self.backgroundColor = color
    }
    
    @IBAction func OnBtnLoveRestaurantTapped(_ sender: Any) {
        if self.item?.liked ?? false {
            print("Trying to dislove a restaurant")
            delegate?.disLoveRestaurant(rest: self.item!)
            LovedManager.shared.removeItem(self.item)
        } else {
            print("Trying to love a restaurant")
            delegate?.loveRestaurant(rest: self.item!)
            LovedManager.shared.addItem(self.item)
        }
    }
    
    
}

extension RestaurantTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell, for: indexPath) as! GenreCollectionViewCell
        cell.lblTitle.text = genres[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let itemStringSize = genres[indexPath.row].sizeOfString(usingFont: genreFont)
               return CGSize(width: itemStringSize.width + 12, height: 20)
    }
    
}
