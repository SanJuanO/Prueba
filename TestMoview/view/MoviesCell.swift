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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(result: Movies) {
        setupCell(result: result)
    }
    
    func setupCell(result: Movies) {
        let playerAV = AVPlayer(url: URL(string: "https://www.youtube.com/watch?v=\(result.key)")!)
        let playerLayerAV = AVPlayerLayer(player: playerAV)
            playerLayerAV.frame = self.video.bounds
        playerLayerAV.frame = self.contentView.bounds
         self.contentView.layer.addSublayer(playerLayerAV)
         playerLayerAV.videoGravity = .resizeAspectFill
         playerAV.play()
    }
}
