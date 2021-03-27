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
    @IBOutlet weak var fisrtThumbNailImageView: UIImageView!
    @IBOutlet weak var secondThumbNailImageView: UIImageView!
    @IBOutlet weak var thirdThumbNailImageView: UIImageView!
    
    static let nibName: String = "AppDataTableViewCell"
    static let identifier: String = "AppDataTableViewCell"
    static let height: CGFloat = 370
        
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconImageView.image = UIImage(named: "")
        self.fisrtThumbNailImageView.image = UIImage(named: "")
        self.secondThumbNailImageView.image = UIImage(named: "")
        self.thirdThumbNailImageView.image = UIImage(named: "")
    }
    
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
        
//        iconImageView.load(urlString: results.artworkUrl60, contentMode: .scaleAspectFit)
        iconImageView.load(results.artworkUrl60)
        
        let screenShotUrlsCount = results.screenshotUrls.count
        
        if screenShotUrlsCount >= 3 {
            fisrtThumbNailImageView.load(results.screenshotUrls[0])
            secondThumbNailImageView.load(results.screenshotUrls[1])
            thirdThumbNailImageView.load(results.screenshotUrls[2])
        } else if screenShotUrlsCount == 2{
            fisrtThumbNailImageView.load(results.screenshotUrls[0])
            secondThumbNailImageView.load(results.screenshotUrls[1])
        } else {
            thirdThumbNailImageView.load(results.screenshotUrls[0])
        }
    }
}
