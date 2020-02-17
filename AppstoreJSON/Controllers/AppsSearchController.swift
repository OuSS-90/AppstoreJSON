//
//  AppsSearchController.swift
//  AppstoreJSON
//
//  Created by OuSS on 2/13/20.
//  Copyright © 2020 OuSS. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    
    private let cellId = "cellId"
    private var appResults = [ResultData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsSearchCell.self, forCellWithReuseIdentifier: cellId)
        fetchItunesApps()
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    private func fetchItunesApps() {
        Service.shared.fetchITtunesApps { (result) in
            switch result {
            case .success(let results):
                self.appResults = results
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsSearchCell
        cell.result = appResults[indexPath.item]
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppsSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}
