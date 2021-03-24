//
//  FifthTabViewController.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

class FifthTabViewController: UIViewController{
    
    
    @IBOutlet weak var appDataListTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!

    var results: [Results] = []
    let searchBar = UISearchBar()
    
    var appDataListNetworkManager: GetAppDataListNetworkManagerDelegate = AppDataListNetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        dismissKeyboardWhenTappedAround()
        
        showEmptyView()
        
        let appDataListCellNib = UINib(nibName: AppDataTableViewCell.nibName, bundle: Bundle.main)
        appDataListTableView.register(appDataListCellNib, forCellReuseIdentifier: AppDataTableViewCell.identifier)
        appDataListTableView.delegate = self
        appDataListTableView.dataSource = self
        
        appDataListTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }

}

//MARK: Delegate - SearchBar
extension FifthTabViewController: UISearchBarDelegate,UISearchControllerDelegate {
    
    // SearchBar Setup
    func setupSearchBar() {
        searchBar.delegate = self
        searchBar.setImage(UIImage(named: "icCancel"), for: .clear, state: .normal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .black
        
        searchBar.sizeToFit()
        searchBar.tintColor = .gray
        searchBar.placeholder = "Search your app"
        search(shouldShow: true)
    }
    
    func search(shouldShow: Bool) {
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    // Touched Search Button
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        appDataListNetworkManager.getAppDataList(delegate: self, searchText: searchBar.text ?? "")
        print("Search Text:",searchBar.text ?? "")
    }
    
    // Check Search Text & Convert Screen
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchText.count == 0 ? showEmptyView() : showTableView()
        print("Search text: \(searchText)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//MARK: App data Table View
extension FifthTabViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppDataTableViewCell.identifier, for: indexPath) as?  AppDataTableViewCell else {
            return UITableViewCell()
        }
        cell.updateUI(results: results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AppDataTableViewCell.height
    }

}

//MARK: Network Delegate
extension FifthTabViewController: GetAppDataListViewDelegate{
    func didRetrieveAppDataInfo(_ results: [Results]) {
        self.results = results
        appDataListTableView.reloadData()
    }
    
    func failedToRequestAppDataInfo(message: String) {
        self.presentAlert(title: message)
    }
}

//MARK: View show & hide
extension FifthTabViewController{
    
    func showTableView(){
        self.appDataListTableView.isHidden = false
        self.emptyView.isHidden = true
    }
    
    func showEmptyView(){
        self.appDataListTableView.isHidden = true
        self.emptyView.isHidden = false
    }
}
