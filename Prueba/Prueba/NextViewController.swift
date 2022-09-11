//
//  NextViewController.swift
//  Pruebas
//
//  Created by Macbook Pro on 25/08/22.
//

import UIKit

class NextViewController: UIViewController {
    
    var textinfo = ""
    
    private lazy var titleLabel: UILabel = {
        let pNameLabel = UILabel()
        pNameLabel.translatesAutoresizingMaskIntoConstraints = false
        pNameLabel.text = textinfo
        pNameLabel.textAlignment = .center
        return pNameLabel
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set data into view outlets
    }
    
    
    func setupController() {
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
}
