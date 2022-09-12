//
//  ProfileViewController.swift
//  Pruebas
//
//  Created by Macbook Pro on 10/09/22.
//


import UIKit

class ProfileViewController: UIViewController {
    
    
    
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    
    private lazy var imageView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.contentMode = .scaleAspectFit
        iView.image = UIImage(named: "profile")
        return iView
    }()
    private let stackInfo: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    
    public lazy var favoriteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Favorite show"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()

    
    private lazy var collectionView: UICollectionView = {
        let cCollectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: CollectionViewLayout())
        cCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cCollectionView.delegate = self
        cCollectionView.dataSource = self
        cCollectionView.showsVerticalScrollIndicator = false
        cCollectionView.showsHorizontalScrollIndicator = false
        cCollectionView.backgroundColor = .clear
        cCollectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        cCollectionView.keyboardDismissMode = .onDrag
        cCollectionView.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: CollectionViewCell.cellName)
        return cCollectionView
    }()
 
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isTranslucent = true
        let userDefaults = UserDefaults.standard
        self.emailLabel.text = userDefaults.string(forKey: "email")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
  
    
     func setupController() {
         view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(stackInfo)
         stackInfo.addArrangedSubview(emailLabel)
         view.addSubview(favoriteLabel)
        view.addSubview(collectionView)

         titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constraints.padding32P).isActive = true
         titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true
         titleLabel.heightAnchor.constraint(equalToConstant: Constraints.padding24P).isActive = true

         imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Constraints.padding8P).isActive = true
         imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.padding32P).isActive = true
         imageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: Constraints.padding8N).isActive = true
         imageView.heightAnchor.constraint(equalToConstant: Constraints.padding80P).isActive = true

         stackInfo.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
         stackInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.padding32P).isActive = true
         stackInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: Constraints.padding16N).isActive = true
         stackInfo.heightAnchor.constraint(equalToConstant: Constraints.padding80P).isActive = true

         favoriteLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constraints.padding42P).isActive = true
         favoriteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         favoriteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true
         favoriteLabel.heightAnchor.constraint(equalToConstant: Constraints.padding24P).isActive = true

         collectionView.topAnchor.constraint(equalTo: favoriteLabel.bottomAnchor,constant: Constraints.padding16P).isActive = true
         collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true
         collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}


@objc extension ProfileViewController {
 
    
    private func showMain() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)

      /*
    let requestAction = RequestAction(endpoint: .authenticate,
                                          body: LoginMapper(telefono: usernameTextView.text, password: passwordTextView.text))
        self.hudView.isHidden = false
       httpRequest.makeRequest(onAction: requestAction,
                                response: AuthorizeMapper.self,
                               onSuccess: { (authorizeMapper) in
                                    DispatchQueue.main.async {
                                            self.hudView.isHidden = true
                                        if authorizeMapper.success {
                                            EmbajadoresVolvo.account = authorizeMapper.datos
                                                AppDelegate.shared.rootViewController.switchToMain()
                                            } else {
                                                self.showErrorAlert(message: authorizeMapper.message)
                                            }
                                    }
                              }, onFailure: generalErrorHandler)
       */
    }
}




extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellName,
                                                  for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? CollectionViewCell {
            //cell.configure(result: ResultMovies)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
  /*      let productsViewController = ProductsViewController()
        productsViewController.hidesBottomBarWhenPushed = true
        productsViewController.category = result[indexPath.row]
        navigationController?.pushViewController(productsViewController, animated: true)*/
    }

}

