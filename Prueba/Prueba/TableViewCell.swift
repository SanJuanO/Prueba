//
//  TableViewCell.swift
//  Pruebas
//
//  Created by Macbook Pro on 25/08/22.
//



import UIKit

class TableViewCell: UITableViewCell {

    static let cellName: String = "tableViewCell"
    var trackingLink: String = ""

    private lazy var titleLabel: UILabel = {
        let pNameLabel = UILabel()
        pNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pNameLabel.text = "Titulo"
        return pNameLabel
    }()

   
  
    private lazy var pountImageView: UIImageView = {
        let piView = UIImageView()
        piView.translatesAutoresizingMaskIntoConstraints = false
        piView.contentMode = .scaleAspectFit
        piView.image = UIImage.init(named: "ok")
        return piView
    }()
        
    private lazy var containerView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.contentMode = .scaleAspectFill
        return iView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    func configure(option: Bool) {
        if option {
            pountImageView.isHidden = true
        } else {
            pountImageView.isHidden = false

        }

    }
    

    
    private func setupCell() {
        
        selectionStyle = .none
        addSubview(containerView)
                backgroundColor = UIColor.clear
        

        containerView.addSubview(titleLabel)
        containerView.addSubview(pountImageView)
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200.0).isActive = true

  
        titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20).isActive = true
        
        pountImageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        pountImageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        pountImageView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 10).isActive = true
        pountImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -20).isActive = true
    
    }
}
