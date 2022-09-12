//
//  CategoryCollectionViewCell.swift
//  RecompensasSuperAuto
//
//  Created by Sergio Acosta Vega on 17/6/21.
//

import UIKit
import YouTubePlayerKit
import YoutubeKit


class MoviesCell: UICollectionViewCell {
    
    static let cellName: String = "collectionViewCell"
    
    private lazy var videoyutube: YTSwiftyPlayer = {
        let youtube = YTSwiftyPlayer()
        youtube.translatesAutoresizingMaskIntoConstraints = false
        return youtube
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(result: Movies) {

   videoyutube.loadPlayerHTML("https://www.youtube.com/watch?v=NHft1RKE3YM")
        
    }
    
    
    func setupCell() {
        contentView.addSubview(videoyutube)
        videoyutube.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        videoyutube.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        videoyutube.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        videoyutube.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    
    }
}
