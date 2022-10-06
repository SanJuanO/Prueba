//
//  CategoryCollectionViewCell.swift
//  RecompensasSuperAuto
//
//  Created by Sergio Acosta Vega on 17/6/21.
//

import UIKit
import AVFoundation

class MoviesCell: UICollectionViewCell {
    
    static let cellName: String = "collectionViewCell"
    
    private lazy var video: UIView = {
        let youtube = UIView()
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
        let playerAV = AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=NHft1RKE3YM")!)
        
        let playerLayerAV = AVPlayerLayer(player: playerAV)
                playerLayerAV.frame = self.video.bounds
                self.video.layer.addSublayer(playerLayerAV)
                playerLayerAV.videoGravity = .resizeAspectFill
                playerAV.play()

        
    }
    
    
    func setupCell() {
        contentView.addSubview(video)
        video.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        video.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        video.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        video.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    
    }
}
