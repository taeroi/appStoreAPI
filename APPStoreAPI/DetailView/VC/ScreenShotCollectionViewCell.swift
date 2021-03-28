//
//  ScreenShotCollectionViewCell.swift
//  AppStoreAPI
//
//  Created by 태로고침 on 2021/03/28.
//

import UIKit

class ScreenShotCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var screenShotImageView: UIImageView!
    
    static let nibName: String = "ScreenShotCollectionViewCell"
    static let identifier: String = "ScreenShotCollectionViewCell"
    
    static let size: CGSize = CGSize(width: 400, height: 300)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(result: Results, i : Int){
        screenShotImageView.load(result.screenshotUrls[i])
    }

}
