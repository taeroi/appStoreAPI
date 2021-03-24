//
//  AppDataTableViewCell.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/24.
//

import UIKit

class AppDataTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var applicationNameLabel: UILabel!
    @IBOutlet weak var userRatingCountLabel: UILabel!
    
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var fisrtThumbNailImageVIew: UIImageView!
    @IBOutlet weak var secondThumbNailImageView: UIImageView!
    @IBOutlet weak var thirdThumbNailImageView: UIImageView!
    
    static let nibName: String = "AppDataTableViewCell"
    static let identifier: String = "AppDataTableViewCell"
    static let height: CGFloat = 370
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateUI(results: Results){
        
        applicationNameLabel.text = results.trackName
        userRatingCountLabel.text = String(format: "%.2f",results.averageUserRatingForCurrentVersion)
        
        iconImageView.load(urlString: results.artworkUrl60, contentMode: .scaleAspectFit)
        
        let screenShotUrlsCount = results.screenshotUrls.count
        
        if screenShotUrlsCount >= 3 {
            fisrtThumbNailImageVIew.load(urlString: results.screenshotUrls[0], contentMode: .scaleToFill)
            secondThumbNailImageView.load(urlString: results.screenshotUrls[1], contentMode: .scaleToFill)
            thirdThumbNailImageView.load(urlString: results.screenshotUrls[2], contentMode: .scaleToFill)
        } else if screenShotUrlsCount == 2{
            fisrtThumbNailImageVIew.load(urlString: results.screenshotUrls[0], contentMode: .scaleToFill)
            secondThumbNailImageView.load(urlString: results.screenshotUrls[1], contentMode: .scaleToFill)
        } else {
            fisrtThumbNailImageVIew.load(urlString: results.screenshotUrls[0], contentMode: .scaleToFill)
        }
    }
}
