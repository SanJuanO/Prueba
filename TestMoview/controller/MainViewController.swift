
    import UIKit

    class MainViewController: UIViewController {

        let httpRequest = HttpRequest.shared
        var result: [ResultMovies] = []
        private let navBarWithTitle: NavBarView = {
            let navBarWithTitle = NavBarView(frame: .zero)
            navBarWithTitle.translatesAutoresizingMaskIntoConstraints = false
            return navBarWithTitle
        }()
        
        private lazy var segmentedControl:  UISegmentedControl = {
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
            //sControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
            return sControl
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
            super.viewWillAppear(animated)
            makeRequest()
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

       func makeRequest() {
            let requestAction = RequestAction(endpoint: .moviewpopular)
            httpRequest.makeRequest(onAction: requestAction, response: Moview.self,
                                    onSuccess: { movi in
                DispatchQueue.main.async {
                self.result = movi.results
                self.collectionView.reloadData()
                }
            }, onFailure: { (_, _) in
                DispatchQueue.main.async {
    print("error")
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
            self.navigationController?.pushViewController(productsViewController, animated: true)
        }

    }

extension MainViewController: NavBarViewDelegate {
    func didClickRight() {
        showAlert()
    }
}
