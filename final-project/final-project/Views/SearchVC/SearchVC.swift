//
//  SearchVC.swift
//  final-project
//
//  Created by Vinsofts on 11/19/20.
//  Copyright © 2020 Vinsofts. All rights reserved.
//

import UIKit

class SearchVC: BaseVC {

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var SearchTableViewCell = "SearchTableViewCell"
    var searchArr = dataRestaurant
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func backAct(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func deleteSearchresult(_ sender: Any) {
        self.txtSearch.text = ""
        self.tableView.reloadData()
        self.tableView.register(UINib(nibName: SearchTableViewCell, bundle: nil), forCellReuseIdentifier: SearchTableViewCell)
    }
    @IBAction func OnTxtSearchTapped(_ sender: UITextField) {
        searchArr.filter{($0.name!.containsIgnoringCase(find: self.txtSearch.text!))}
        self.tableView.reloadData()
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell, for: indexPath) as! SearchTableViewCell
        if let title = searchArr[indexPath.row].name {
            cell.lbl.text = title
        }
        if let image = searchArr[indexPath.row].image {
            cell.img.kf.setImage(with: URL(string: image))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = RestaurantDetailVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
