//
//  AppsSearchCell.swift
//  AppstoreJSON
//
//  Created by OuSS on 2/15/20.
//  Copyright © 2020 OuSS. All rights reserved.
//

import UIKit

class AppsSearchCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.anchor(size: CGSize(width: 64, height: 64))
        iv.layer.cornerRadius = 12
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
        imageView.backgroundColor = .blue
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
