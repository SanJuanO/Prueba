//
//  ProfileViewController.swift
//  Pruebas
//
//  Created by Macbook Pro on 10/09/22.
//


import UIKit

class DetailMovieViewController: UIViewController {
    
    let httpRequest = HttpRequest.shared
    var result: [Movies] = []
    var identifier = ""

    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name movie"
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var imageView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.contentMode = .scaleAspectFit
        iView.image = UIImage(named: "icon_start")
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
    private let stackcalf: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 6
        return stack
    }()
    private lazy var imagefavoriteView: UIButton = {
        let cImageView = UIButton()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.contentMode = .scaleAspectFill
        cImageView.setImage(UIImage(named: "heartall"), for: .normal)
        return cImageView
    }()

    private lazy var imagecalfView: UIImageView = {
        let cImageView = UIImageView()
        cImageView.translatesAutoresizingMaskIntoConstraints = false
        cImageView.image = UIImage.init(named: "fillStarIcon")
        cImageView.contentMode = .scaleAspectFill
        return cImageView
    }()
        
    public lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Date"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()
    public lazy var califLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Calif"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()

    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    public lazy var trailerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Trailers"
        label.textColor = UIColor.white
        label.textAlignment = .left
        return label
    }()

    internal lazy var hudView: HudView = {
        let hView = HudView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        hView.layer.masksToBounds = true
        hView.layer.cornerRadius = 10.0
        hView.isHidden = true
        return hView
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
        cCollectionView.register(MoviesCell.self,
                                 forCellWithReuseIdentifier: MoviesCell.cellName)
        return cCollectionView
    }()
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupController()
        makeReques()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
    
    
    func makeReques() {
        self.hudView.isHidden = false
        let requestAction = RequestAction(endpoint: .videomovis(self.identifier))
         httpRequest.makeRequest(onAction: requestAction, response: 
                                    Trailers.self,
                                 onSuccess: { movies in
             DispatchQueue.main.async {
                 self.hudView.isHidden = true
             self.result = movies.results
             self.collectionView.reloadData()
             }
         }, onFailure: { (_, _) in
             DispatchQueue.main.async {
                 self.hudView.isHidden = true
                 print("error")
              }
          })
    }
    
    func configure(result: ResultMovies) {
        let url = URL(string: Prueba.image + result.posterpath)
        self.imageView.kf.setImage(with: url)
        self.titleLabel.text = result.title
        self.dateLabel.text = result.releasedate
       self.califLabel.text = "\(result.popularity)"
        self.descriptionLabel.text = result.overview
        self.identifier = "\(result.identifier)"
    }
    
     func setupController() {
         view.backgroundColor = .black
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(stackInfo)
         stackInfo.addArrangedSubview(dateLabel)
         stackInfo.addArrangedSubview(stackcalf)
         stackcalf.addArrangedSubview(imagecalfView)
         stackcalf.addArrangedSubview(califLabel)
         stackInfo.addArrangedSubview(imagefavoriteView)
         view.addSubview(descriptionLabel)
         view.addSubview(trailerLabel)
        view.addSubview(collectionView)
         
          view.addSubview(hudView)
          hudView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
          hudView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
          hudView.heightAnchor.constraint(equalTo: hudView.widthAnchor).isActive = true
          hudView.widthAnchor.constraint(equalToConstant: 100).isActive = true
          

         titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constraints.padding42P).isActive = true
         titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true

         imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: Constraints.padding8P).isActive = true
         imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.padding32P).isActive = true
         imageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: Constraints.padding8N).isActive = true
         imageView.heightAnchor.constraint(equalToConstant: Constraints.padding154P).isActive = true

         stackInfo.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
         stackInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constraints.padding32P).isActive = true
         stackInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: Constraints.padding16N).isActive = true
         stackInfo.heightAnchor.constraint(equalToConstant: Constraints.padding80P).isActive = true

         descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constraints.padding42P).isActive = true
         descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true
         
         imagefavoriteView.heightAnchor.constraint(equalToConstant: Constraints.padding32P).isActive = true
         imagefavoriteView.widthAnchor.constraint(equalTo: imagefavoriteView.heightAnchor).isActive = true

         imagecalfView.heightAnchor.constraint(equalToConstant: Constraints.padding16P).isActive = true
         imagecalfView.widthAnchor.constraint(equalTo: imagecalfView.heightAnchor).isActive = true

         trailerLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constraints.padding42P).isActive = true
         trailerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         trailerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true
         trailerLabel.heightAnchor.constraint(equalToConstant: Constraints.padding24P).isActive = true

         collectionView.topAnchor.constraint(equalTo: trailerLabel.bottomAnchor,constant: Constraints.padding16P).isActive = true
         collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constraints.padding16N).isActive = true
         collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constraints.padding16P).isActive = true
         collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}


@objc extension ProfileViewController {
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
 
    
    private func showMainController() {
        self.navigationController?.pushViewController(MainViewController(), animated: true)
    }
}




extension DetailMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: MoviesCell.cellName,
                                                  for: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? MoviesCell {
            cell.configure(result: result[indexPath.item])
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

