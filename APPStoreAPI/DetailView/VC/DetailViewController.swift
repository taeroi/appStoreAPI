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
    @IBOutlet weak var censoredNameLabel: UILabel!
    @IBOutlet weak var userRatingCountLabel: UILabel!
    @IBOutlet weak var userRateAverageLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var releaseNoteLabel: UILabel!
    @IBOutlet weak var overViewCollectionView: UICollectionView!
    
    var results: Results
    
    init(results: Results){
        self.results = results
        super.init(nibName: "DetailViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        let overViewCollectionCellNib = UINib(nibName: ScreenShotCollectionViewCell.nibName, bundle: Bundle.main)
        overViewCollectionView.register(overViewCollectionCellNib, forCellWithReuseIdentifier: ScreenShotCollectionViewCell.identifier)
        overViewCollectionView.delegate = self
        overViewCollectionView.dataSource = self
    }
    
    func updateUI(){
        iconImageView.load(results.artworkUrl60)
        nameLabel.text = results.trackName
        censoredNameLabel.text = results.trackCensoredName
        userRatingCountLabel.text = "\(results.userRatingCount)개의 평가"
        userRateAverageLabel.text = "\(String(format:"%.2f",results.averageUserRatingForCurrentVersion))"
        ageLabel.text = results.contentAdvisoryRating
        developerLabel.text = results.artistName
        languageLabel.text = results.languageCodesISO2A[0]
        versionLabel.text = results.version
        
        releaseNoteLabel.text = results.releaseNotes
        releaseNoteLabel.numberOfLines = 3
        releaseNoteLabel.lineBreakMode = .byWordWrapping
        
    }
}


extension DetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(results.screenshotUrls.count)
        return results.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return ScreenShotCollectionViewCell.size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScreenShotCollectionViewCell.identifier, for: indexPath) as? ScreenShotCollectionViewCell else { return UICollectionViewCell()}
    
        if results.screenshotUrls.count != 0 {
            for i in 0...results.screenshotUrls.count - 1 {
                cell.updateUI(result: results, i: i)
            }
        } else {
            return cell
        }
        return cell
    }
    
    
}
