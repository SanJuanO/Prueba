//
//  LoginViewController.swift
//  Pruebas
//
//  Created by Macbook Pro on 09/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let httpRequest = HttpRequest.shared
    var token = ""
    
    private lazy var imageView: UIImageView = {
        let iView = UIImageView()
        iView.translatesAutoresizingMaskIntoConstraints = false
        iView.contentMode = .scaleAspectFit
        iView.image = UIImage(named: "logofondoblanco")
        return iView
    }()
    
   private lazy var backgroundImageView: UIImageView = {
        let iView = UIImageView()
       iView.translatesAutoresizingMaskIntoConstraints = false
       iView.image = UIImage(named: "iniciofondo")
        return iView
    }()
    
    public lazy var usernameTextView: LoginTextField = {
        let uTextField = LoginTextField()
        uTextField.translatesAutoresizingMaskIntoConstraints = false
        uTextField.keyboardType = .emailAddress
        uTextField.addTarget(self, action: #selector(dismissKeyboard), for: .primaryActionTriggered)
        uTextField.placeholder = "Username"
        uTextField.text = "sanjuano"

        return uTextField
    }()
    
    public lazy var passwordTextView: LoginTextField = {
        let pTextField = LoginTextField()
        pTextField.translatesAutoresizingMaskIntoConstraints = false
        pTextField.placeholder = "Password"
        pTextField.text = "oscar1234"
        pTextField.addTarget(self, action: #selector(dismissKeyboard), for: .primaryActionTriggered)
        pTextField.isSecureTextEntry = true
        return pTextField
    }()
    

    internal lazy var hudView: HudView = {
        let hView = HudView()
        hView.translatesAutoresizingMaskIntoConstraints = false
        hView.layer.masksToBounds = true
        hView.layer.cornerRadius = 10.0
        hView.isHidden = true
        return hView
    }()
    
    
    private lazy var enterButton: UIButton = {
        let lButton = UIButton()
        lButton.translatesAutoresizingMaskIntoConstraints = false
        lButton.setTitle("Login In", for: .normal)
        lButton.backgroundColor = UIColor.gray
        lButton.setTitleColor(UIColor.white, for: .normal)
        lButton.layer.masksToBounds = true
        lButton.addTarget(self, action: #selector(showMainController), for: .touchUpInside)
        return lButton
    }()
    

    public lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Error"
        label.textColor = UIColor.red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isTranslucent = true
        self.gettoken()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
    
  
    
     func setupController() {
        view.addSubview(backgroundImageView)
        view.addSubview(imageView)
        view.addSubview(usernameTextView)
        view.addSubview(passwordTextView)
         view.addSubview(enterButton)
         view.addSubview(errorLabel)
         view.addSubview(hudView)
         hudView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         hudView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
         hudView.heightAnchor.constraint(equalTo: hudView.widthAnchor).isActive = true
         hudView.widthAnchor.constraint(equalToConstant: 100).isActive = true

        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        
        usernameTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40).isActive = true
        usernameTextView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        usernameTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40).isActive = true
                
        passwordTextView.leadingAnchor.constraint(equalTo: usernameTextView.leadingAnchor).isActive = true
        passwordTextView.topAnchor.constraint(equalTo: usernameTextView.bottomAnchor, constant: 20).isActive = true
        passwordTextView.trailingAnchor.constraint(equalTo: usernameTextView.trailingAnchor).isActive = true

        enterButton.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor,constant: 30).isActive = true
         enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
         enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
         
         errorLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor,constant: 10).isActive = true
         errorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
         errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
    }
    
}


@objc extension LoginViewController {
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    

    private func gettoken() {
    let requestAction = RequestAction(endpoint: .gettoken)
        self.httpRequest.makeRequest(onAction: requestAction,
                                response: Token.self,
                               onSuccess: { (token) in
                                    DispatchQueue.main.async {
                                        self.token = token.requesttoken ?? ""
                                    }
        }, onFailure: { (_, _) in
            DispatchQueue.main.async {
print("error")
             }
         })
    }
    
    private func showMainController() {
        self.hudView.isHidden = false
    let requestAction = RequestAction(endpoint: .authenticate,
                                      body: ["username":usernameTextView.text!,"password":passwordTextView.text,"request_token":token])
        self.httpRequest.makeRequest(onAction: requestAction,
                                response: AuthorizeMapper.self,
                               onSuccess: { (authorizeMapper) in
                                    DispatchQueue.main.async {
                                        self.hudView.isHidden = true

                                        if authorizeMapper.success {
                                            self.navigationController?.pushViewController(MainViewController(), animated: true)

                                        } else {
                                            self.errorLabel.isHidden = false
                                            self.errorLabel.text = authorizeMapper.statusmessage
                                        }
                                    }
        }, onFailure: { (_, _) in
            DispatchQueue.main.async {
                self.hudView.isHidden = true
                self.errorLabel.isHidden = false
                self.errorLabel.text = "Other error"
             }
         })
    }
}

