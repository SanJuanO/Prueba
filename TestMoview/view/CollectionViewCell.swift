//
//  CategoryCollectionViewCell.swift
//  RecompensasSuperAuto
//
//  Created by Sergio Acosta Vega on 17/6/21.
//

import UIKit
//import Kingfisher

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
        cImageView.contentMode = .scaleToFill
        cImageView.backgroundColor = .blue
        cImageView.layer.cornerRadius = 8
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
    
    private lazy var imagefavoriteView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.contentMode = .scaleToFill
        cImageView.backgroundColor = .blue
        cImageView.layer.cornerRadius = 8
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.font = UIFont.global(font: .sansLight, ofSize: 14)
        tLabel.textColor = UIColor.white
        tLabel.text = "Título"
        tLabel.numberOfLines = 0
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
        cImageView.contentMode = .scaleToFill
        cImageView.backgroundColor = .blue
        cImageView.layer.cornerRadius = 8
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
      //  let url = URL(string: Prueba.image + result.posterpath)
        ///self.imageView.kf.setImage(with: url)
        self.titleLabel.text = result.title
        self.dateLabel.text = result.releasedate
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
        imageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 40).isActive = true
            
        titleLabel.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        

        imagefavoriteView.topAnchor.constraint(greaterThanOrEqualTo: imageView.bottomAnchor,constant: 5).isActive = true
        imagefavoriteView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        imagefavoriteView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        imagefavoriteView.widthAnchor.constraint(equalToConstant: 15).isActive = true

        dateLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor,constant: 5).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        
        calLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor,constant: 5).isActive = true
        calLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        
        imgcalifView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor,constant: 5).isActive = true
        imgcalifView.trailingAnchor.constraint(equalTo: calLabel.leadingAnchor, constant: -10.0).isActive = true
        
        descriptiotextview.topAnchor.constraint(greaterThanOrEqualTo: dateLabel.bottomAnchor,constant: 5).isActive = true
        descriptiotextview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0).isActive = true
        descriptiotextview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0).isActive = true
        descriptiotextview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0).isActive = true
    }
}
