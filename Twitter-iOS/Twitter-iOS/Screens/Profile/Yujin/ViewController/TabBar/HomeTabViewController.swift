//
//  FirstTabViewController.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit

class HomeTabVHomeTabViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let tables = tableView.compactMap { $0 as? UITableViewController }
//        tables.forEach {
//            $0.tableView.contentInset = UIEdgeInsets(top: headerView.bounds.height, left: 0, bottom: 0, right: 0)
//            $0.tableView.contentOffset = CGPoint(x: 0, y: -headerView.bounds.height)
//        }
    }
    private func registerCell() {
        let myTwittNib = UINib(nibName: TwitterMyTwittTableViewCell.identifier, bundle: nil)
        let reTwittNib = UINib(nibName: TwitterRetwittTableViewCell.identifier, bundle: nil)
        
        tableView.register(myTwittNib, forCellReuseIdentifier: TwitterMyTwittTableViewCell.identifier)
        tableView.register(reTwittNib, forCellReuseIdentifier: TwitterRetwittTableViewCell.identifier)
    }
    
}
extension HomeTabVHomeTabViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //        let twitt = TwittModel.sampleData[indexPath.row]
        //        switch twitt.type {
        //        case .myTwitt:
        //            return 87
        //        default:
        //            return 204
        return UITableView.automaticDimension
    }
}
extension HomeTabVHomeTabViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let twittCells = TwittModel.sampleData[indexPath.row]
        
        switch twittCells.type {
            
        case .reTwitt:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TwitterRetwittTableViewCell.identifier) as? TwitterRetwittTableViewCell else {return UITableViewCell() }
            cell.setData(TwittModel.sampleData[indexPath.row])
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TwitterMyTwittTableViewCell.identifier) as? TwitterMyTwittTableViewCell else {return UITableViewCell() }
            cell.setData(TwittModel.sampleData[indexPath.row])
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TwittModel.sampleData.count
    }
}
