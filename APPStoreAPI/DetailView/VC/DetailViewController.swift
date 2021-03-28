//
//  DetailViewController.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userRateCountLabel: UILabel!
    @IBOutlet weak var userRateAverageLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var chartLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    
    
    
    var results: [Results]
    
        init(results: Results){
        self.results = [results]
        super.init(nibName: "DetailViewController", bundle: Bundle.main)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(results)
    }
    
}
