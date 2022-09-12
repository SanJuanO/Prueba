//
//  NavBarView.swift
//  Pruebas
//
//  Created by Macbook Pro on 10/09/22.
//

import UIKit

// MARK: - View Delegate
protocol NavBarViewDelegate: AnyObject {
    func didClickRight()
}

class  NavBarView: UIView {
    
    // MARK: - Variable declaration
    weak var delegate: NavBarViewDelegate?
    
    private let containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .gray
        return view
    }()
    

    // MARK: - View declaration
    var buttonRight: UIButton =  {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(named: "sortIcon"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    var labelTitle: UILabel =  {
        let label = UILabel(frame: .zero)
        label.font = UIFont.global(font: .sansLight, ofSize: 16)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "TV Show"
        return label
    }()
    
     var imgcomposition: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    // MARK: - Override Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Initializers
    internal func initUI() {
        initViews()
        initListeners()
        initConstraints()
    }

    // MARK: - Add subviews
    internal func initViews() {
        addSubview(containerView)
        containerView.addSubview(buttonRight)
        containerView.addSubview(labelTitle)
    }

    // MARK: - Add Constraints
    func initConstraints() {
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.buttonRight.translatesAutoresizingMaskIntoConstraints = false
        self.labelTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            labelTitle.trailingAnchor.constraint(equalTo: buttonRight.leadingAnchor, constant: Constraints.padding12P),
            labelTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constraints.padding12P),
            labelTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: Constraints.padding8N),
            
            buttonRight.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: Constraints.padding24N),
            buttonRight.heightAnchor.constraint(equalToConstant: Constraints.padding16P),
            buttonRight.widthAnchor.constraint(equalToConstant: Constraints.padding16P),
            buttonRight.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constraints.padding48P),
          

        ])
    }
    
    // MARK: - Add Listeners
    internal func initListeners() {
        self.buttonRight.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
    }
        
    @objc func didClickButton() {
        delegate?.didClickRight()
    }
    
}
