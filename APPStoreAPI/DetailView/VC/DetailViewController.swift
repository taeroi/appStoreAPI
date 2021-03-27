//
//  DetailViewController.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

class DetailViewController: UIViewController {
    
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
