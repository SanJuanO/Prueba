
    import UIKit

    class MainViewController: UIViewController {

        let httpRequest = HttpRequest.shared
        var result: [ResultMovies] = []
        var option = 1
        private let navBarWithTitle: NavBarView = {
            let navBarWithTitle = NavBarView(frame: .zero)
            navBarWithTitle.translatesAutoresizingMaskIntoConstraints = false
            return navBarWithTitle
        }()
        
        private lazy var segmentedControl: UISegmentedControl = {
            let sControl = UISegmentedControl()
            sControl.translatesAutoresizingMaskIntoConstraints = false
            sControl.insertSegment(withTitle: "Popular", at: 0, animated: false)
            sControl.insertSegment(withTitle: "Top Rated", at: 1, animated: false)
            sControl.insertSegment(withTitle: "On TV", at: 2, animated: false)
            sControl.insertSegment(withTitle: "Airing Today", at: 3, animated: false)

            sControl.setTitleTextAttributes([.foregroundColor: UIColor.white as Any,
                                             .font: UIFont.global(font: .sansLight, ofSize: 11)  as Any],
                                            for: .normal)
            sControl.setTitleTextAttributes([.foregroundColor: UIColor.white,
                                             .font:  UIFont.global(font: .sansLight, ofSize: 11) as Any],
                                            for: .selected)
            
            sControl.selectedSegmentIndex = 0
            sControl.backgroundColor = UIColor.black
            sControl.selectedSegmentTintColor = UIColor.gray
            sControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
            return sControl
        }()
        
        @objc func valueChanged() {
            if self.segmentedControl.selectedSegmentIndex == 0 {
                makeRequestpopular()
            } else if self.segmentedControl.selectedSegmentIndex == 1 {
makeRequesttop()
            } else if self.segmentedControl.selectedSegmentIndex == 2 {
makeRequestontv()
            } else {
makeRequestairin()
            }
        }
        
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
    
        internal lazy var hudView: HudView = {
            let hView = HudView()
            hView.translatesAutoresizingMaskIntoConstraints = false
            hView.layer.masksToBounds = true
            hView.layer.cornerRadius = 10.0
            hView.isHidden = true
            return hView
        }()
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            makeRequestpopular()
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
     }
        
        override func viewDidLoad() {
            super.viewDidLoad()
      setupController()
        }
        
        
         func setupController() {
             view.addSubview(navBarWithTitle)
             view.addSubview(segmentedControl)
            view.addSubview(collectionView)
             view.addSubview(hudView)
             hudView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
             hudView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
             hudView.heightAnchor.constraint(equalTo: hudView.widthAnchor).isActive = true
             hudView.widthAnchor.constraint(equalToConstant: 100).isActive = true
             
             self.navBarWithTitle.delegate = self
             
            
             navBarWithTitle.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
             navBarWithTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
             navBarWithTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
             navBarWithTitle.heightAnchor.constraint(equalToConstant: Constraints.heightNavBarTitle).isActive = true

             segmentedControl.topAnchor.constraint(equalTo: navBarWithTitle.bottomAnchor,constant: Constraints.padding16P).isActive = true
             segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
             segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            
             collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor).isActive = true
             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
             collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
             collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

       func makeRequestpopular() {
           self.hudView.isHidden = false
            let requestAction = RequestAction(endpoint: .moviewpopular)
            httpRequest.makeRequest(onAction: requestAction, response: Moview.self,
                                    onSuccess: { movi in
                DispatchQueue.main.async {
                    self.hudView.isHidden = true
                self.result = movi.results
                self.collectionView.reloadData()
                }
            }, onFailure: { (_, _) in
                DispatchQueue.main.async {
                    self.hudView.isHidden = true
                 }
             })
       }
        
        func makeRequesttop() {
            self.hudView.isHidden = false

             let requestAction = RequestAction(endpoint: .toprated)
             httpRequest.makeRequest(onAction: requestAction, response: Moview.self,
                                     onSuccess: { movi in
                 DispatchQueue.main.async {
                     self.hudView.isHidden = true
                 self.result = movi.results
                 self.collectionView.reloadData()
                 }
             }, onFailure: { (_, _) in
                 DispatchQueue.main.async {
                     self.hudView.isHidden = true
                  }
              })
        }
        
        func makeRequestontv() {
            self.hudView.isHidden = false

             let requestAction = RequestAction(endpoint: .tvontheair)
             httpRequest.makeRequest(onAction: requestAction, response: Moview.self,
                                     onSuccess: { movi in
                 DispatchQueue.main.async {
                     self.hudView.isHidden = true
                 self.result = movi.results
                 self.collectionView.reloadData()
                 }
             }, onFailure: { (_, _) in
                 DispatchQueue.main.async {
                     self.hudView.isHidden = true
                  }
              })
        }
        func makeRequestairin() {
            self.hudView.isHidden = false

             let requestAction = RequestAction(endpoint: .tvairingtoday)
             httpRequest.makeRequest(onAction: requestAction, response: Moview.self,
                                     onSuccess: { movi in
                 DispatchQueue.main.async {
                     self.hudView.isHidden = true
                 self.result = movi.results
                 self.collectionView.reloadData()
                 }
             }, onFailure: { (_, _) in
                 DispatchQueue.main.async {
                     self.hudView.isHidden = true
                  }
              })
        }
        
        func showAlert() {
            let alert: UIAlertController = UIAlertController(title: "What do you want to do?", message: "", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Profile", style: .default,handler: {action in
                     let profile = ProfileViewController()
                profile.modalPresentationStyle = .automatic
                profile.modalTransitionStyle = .coverVertical
                self.present(profile, animated: true)
            }))
            alert.addAction(UIAlertAction(title: "Log out", style: .destructive,handler: {action in
                let profile = LoginViewController()
           profile.modalPresentationStyle = .popover
           self.navigationController?.pushViewController(profile, animated: true)
                
            }))

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }

    extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.result.count
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            return collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellName,
                                                      for: indexPath)
        }

        func collectionView(_ collectionView: UICollectionView,
                            willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if let cell = cell as? CollectionViewCell {
                cell.configure(result: result[indexPath.item])
            }
        }
        
        func collectionView(_ collectionView: UICollectionView,
                            didSelectItemAt indexPath: IndexPath) {
           let productsViewController = DetailMovieViewController()
            productsViewController.configure(result: self.result[indexPath.item])
            self.navigationController?.pushViewController(productsViewController, animated: true)
        }

    }

extension MainViewController: NavBarViewDelegate {
    func didClickRight() {
        showAlert()
    }
}
