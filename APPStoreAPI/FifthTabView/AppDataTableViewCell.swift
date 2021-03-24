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
    @IBOutlet weak var starRateImageView: UIImageView!
    @IBOutlet weak var userRatingCountLabel: UILabel!
    
    @IBOutlet weak var downloadBtn: UIButton!
    @IBOutlet weak var fisrtThumbNailImageVIew: UIImageView!
    @IBOutlet weak var secondThumbNailImageView: UIImageView!
    @IBOutlet weak var thirdThumbNailImageView: UIImageView!
        
    static let nibName: String = "AppDataTableViewCell"
    static let identifier: String = "AppDataTableViewCell"
    static let height: CGFloat = 300
    
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
    }
}
