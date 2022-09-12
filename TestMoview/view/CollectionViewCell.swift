//
//  CategoryCollectionViewCell.swift
//  RecompensasSuperAuto
//
//  Created by Sergio Acosta Vega on 17/6/21.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    static let cellName: String = "collectionViewCell"
    
    private lazy var categoryImageView: UIView = {
        let cImageView = UIView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.contentMode = .scaleToFill
        cImageView.backgroundColor = .orange
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
    private lazy var imageView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
    
    private lazy var imagefavoriteView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.image = UIImage.init(named: "heart")
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.font = UIFont.global(font: .sansLight, ofSize: 14)
        tLabel.textColor = UIColor.white
        tLabel.text = "Título"
        tLabel.numberOfLines = 2
        return tLabel
    }()
    
    private lazy var dateLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.font = UIFont.global(font: .sansLight, ofSize: 12)
        tLabel.textColor = UIColor.white
        tLabel.text = "sep 08 2021"
        return tLabel
    }()
    
    private lazy var imagestartView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.image = UIImage.init(named: "fillStarIcon")
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
    
    private lazy var calLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.font = UIFont.global(font: .sansLight, ofSize: 12)
        tLabel.textColor = UIColor.white
        tLabel.text = "7.8"
        return tLabel
    }()
    
    private lazy var descriptiotextview: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.font = UIFont.global(font: .sansLight, ofSize: 10)
        tLabel.textColor = UIColor.white
        tLabel.numberOfLines = 4
        tLabel.text = "dsfldsfds dsflkjadsfljksd dsflkdsfjlkasd dsflkjadsfjkldsaf dslfdsfjlj"
        return tLabel
    }()
    
    private lazy var imgcalifView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.contentMode = .scaleToFill
        cImageView.image = UIImage.init(named: "icon_start")
        cImageView.layer.cornerRadius = 8
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(result: ResultMovies) {
        let url = URL(string: Prueba.image + result.posterpath)
        self.imageView.kf.setImage(with: url)
        self.titleLabel.text = result.title ?? (result.name ?? "")
        self.dateLabel.text = result.releasedate ?? (result.firstairdate ?? "")
        self.calLabel.text = "\(result.popularity)"
        self.descriptiotextview.text = result.overview
    }
    
    func setupCell() {
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
        
        contentView.addSubview(categoryImageView)
        categoryImageView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(calLabel)
        contentView.addSubview(imagefavoriteView)
        contentView.addSubview(imgcalifView)
        contentView.addSubview(descriptiotextview)

        categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        categoryImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        categoryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor,constant: Constraints.padding80N).isActive = true
            
        titleLabel.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constraints.padding12P).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constraints.padding16N).isActive = true
        

        imagefavoriteView.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: Constraints.padding32P).isActive = true
        imagefavoriteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constraints.padding4N).isActive = true
        imagefavoriteView.heightAnchor.constraint(equalToConstant: Constraints.padding16P).isActive = true
        imagefavoriteView.widthAnchor.constraint(equalToConstant: Constraints.padding16P).isActive = true

        dateLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor,constant: Constraints.padding4P).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constraints.padding4P).isActive = true
        
        calLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor,constant: Constraints.padding4P).isActive = true
        calLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constraints.padding12N).isActive = true
        
        imgcalifView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor,constant: Constraints.padding4P).isActive = true
        imgcalifView.trailingAnchor.constraint(equalTo: calLabel.leadingAnchor, constant: Constraints.padding12N).isActive = true
        
        descriptiotextview.topAnchor.constraint(greaterThanOrEqualTo: dateLabel.bottomAnchor,constant: Constraints.padding4P).isActive = true
        descriptiotextview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constraints.padding12P).isActive = true
        descriptiotextview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constraints.padding12N).isActive = true
        descriptiotextview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Constraints.padding4N).isActive = true
    }
}
