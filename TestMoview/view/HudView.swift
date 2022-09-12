//
//  HudView.swift
//  Heartland Splenda
//
//  Created by Edgar Gerardo Flores Lopez on 21/09/20.
//  Copyright © 2020 Edgar Gerardo Flores Lopez. All rights reserved.
//

import UIKit

class HudView: UIView {
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let aIndicatorView = UIActivityIndicatorView()
        aIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        aIndicatorView.color = .white
        aIndicatorView.hidesWhenStopped = true
        aIndicatorView.startAnimating()
        return aIndicatorView
    }()
    private lazy var titleLabel: UILabel = {
        let tLabel = UILabel()
        tLabel.translatesAutoresizingMaskIntoConstraints = false
        tLabel.font = UIFont.global(font: .sansLight, ofSize: 14)
        tLabel.textColor = .white
        tLabel.text = "Loading"
        tLabel.adjustsFontSizeToFitWidth = true
        tLabel.textAlignment = .center
        return tLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    func setTitle(title: String) {
        titleLabel.text = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        addSubview(activityIndicatorView)
        addSubview(titleLabel)
        activityIndicatorView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        activityIndicatorView.widthAnchor.constraint(equalTo: activityIndicatorView.heightAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(greaterThanOrEqualTo: centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15 ).isActive = true
    }
}
