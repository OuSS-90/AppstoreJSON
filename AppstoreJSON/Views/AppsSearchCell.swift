//
//  AppsSearchCell.swift
//  AppstoreJSON
//
//  Created by OuSS on 2/15/20.
//  Copyright © 2020 OuSS. All rights reserved.
//

import UIKit
import SDWebImage

class AppsSearchCell: UICollectionViewCell {
    
    var result: ResultData? {
        didSet {
            
            guard let result = result else { return }
            
            nameLabel.text = result.trackName
            categoryLabel.text = result.primaryGenreName
            ratingsLabel.text = "\(result.averageUserRating ?? 0)"
            
            let url = URL(string: result.artworkUrl100)
            appIconImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string: result.screenshotUrls[0]))
            
            if result.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: result.screenshotUrls[1]))
            }
            
            if result.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: result.screenshotUrls[2]))
            }
        }
    }
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.anchor(size: CGSize(width: 64, height: 64))
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.anchor(size: CGSize(width: 80, height: 32))
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenshotImageView()
    lazy var screenshot2ImageView = self.createScreenshotImageView()
    lazy var screenshot3ImageView = self.createScreenshotImageView()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let labelsSv = UIStackView(nameLabel, categoryLabel, ratingsLabel, axis: .vertical)
        let topInfoSv = UIStackView(appIconImageView, labelsSv, getButton, spacing: 12, alignment: .center)
        let screenshotsSv = UIStackView(screenshot1ImageView, screenshot2ImageView, screenshot3ImageView, spacing: 12,  distribution: .fillEqually)
        let overallSv = UIStackView(topInfoSv, screenshotsSv, spacing: 16, axis: .vertical)
        
        addSubview(overallSv)
        overallSv.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
