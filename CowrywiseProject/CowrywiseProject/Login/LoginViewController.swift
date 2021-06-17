//
//  LoginController.swift
//  CowrywiseProject
//
//  Created by Decagon on 08/05/2021.
//

import UIKit

class LoginViewController: UIViewController {
    //    private var userProfileController: UserProfileViewController!
    private let horizontalLine = HorizontalLine()
    private let color = HexColourDelegate()
    private var passwordBorderLine: UIView!
    private var  emailBorderLine: UIView!
    
    private var headerView: UIView!
    private var headerBackgroundImage: UIImageView!
    private var loginLogo: UIImageView!
    private var headerLabel: UILabel!
    
    private var bottomView: UIView!
    private var titleLabel: UILabel!
    private var emailLabel: UILabel!
    private var emailTextField: UITextField!
    private var passwordLabel: UILabel!
    private var passwordTextField: UITextField!
    private var passwordIcon: UIButton!
    private var loginButton: UIButton!
    private var forgotPasswordLabel: UILabel!
    
    
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = color.blue
        
        //MARK: - Views
        
        // HeaderView
        headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = color.blue
        headerView.alpha = 0.5
        
        // headerBackGroundImage
        headerBackgroundImage = UIImageView()
        headerBackgroundImage.translatesAutoresizingMaskIntoConstraints = false
        headerBackgroundImage.image = #imageLiteral(resourceName: "cowrywiseimage-removebg-preview")
        headerBackgroundImage.alpha = 0.3
        headerBackgroundImage.contentMode = .scaleAspectFill
        
        // header logo
        loginLogo = UIImageView()
        loginLogo.translatesAutoresizingMaskIntoConstraints = false
        loginLogo.contentMode = .scaleAspectFit
        loginLogo.image = #imageLiteral(resourceName: "cowrywiselogo")
        loginLogo.backgroundColor = .white
        
        // header label
        headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont(name: "Helvetica", size: 25)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 35)
        headerLabel.text = "Cowrywise"
        headerLabel.textColor = color.white
        
        // BottomView
        bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = color.white
        
        //title Label
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Helvetica", size: 25)
        titleLabel.text = "Jump right back in."
        titleLabel.alpha = 0.8
        
        //Email Label
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.font = UIFont(name: "Helvetica", size: 17)
        emailLabel.text = "Email Address"
        emailLabel.alpha = 0.6
        
        //Email TextField
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont.italicSystemFont(ofSize: 20)
        
        // Password Label
        passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.font = UIFont(name: "Helvetica", size: 17)
        passwordLabel.text = "Password"
        passwordLabel.alpha = 0.6
        
        //Password TextField
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.italicSystemFont(ofSize: 20)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addLine(position: .bottom, color: color.grey, width: 1)
        
        //Password Button Icon
        passwordIcon = UIButton()
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let boldSearch = UIImage(systemName: "eye", withConfiguration: boldConfig)
        passwordIcon.setImage(boldSearch, for: .normal)
        view.addSubview(passwordIcon)
        
        // Login Button
        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 17)
        loginButton.backgroundColor = color.blue
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)  // didTapButton
        bottomView.addSubview(loginButton)
        
        // Forgot password
        forgotPasswordLabel = UILabel()
        forgotPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordLabel.font = UIFont(name: "Helvetica", size: 17)
        forgotPasswordLabel.textColor = color.blue
        forgotPasswordLabel.text = "Forgot password?."
        
        //Views
        let safeArea = view.safeAreaLayoutGuide
        emailBorderLine = horizontalLine
        passwordBorderLine = horizontalLine
        
        
        [headerBackgroundImage].forEach{headerView.addSubview($0)}
        
        [titleLabel, emailLabel, emailTextField, passwordLabel, passwordTextField, passwordIcon,forgotPasswordLabel].forEach{bottomView.addSubview($0)}
        
        [loginLogo, headerLabel, headerView, bottomView, emailBorderLine, passwordBorderLine].forEach{view.addSubview($0)}
        
        emailBorderLine.anchor(top: emailTextField.bottomAnchor, leading: safeArea.leadingAnchor, bottom: nil, trailing: safeArea.trailingAnchor, padding: .init(top: 5, left: 20, bottom: 0, right: 20))
        //        passwordIcon.anchor(top: bottomView.topAnchor, leading: bottomView.leadingAnchor, bottom: nil, trailing: nil)
        
        
        //MARK: - NSLayoutConstraints
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.4),
            headerView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            
            headerBackgroundImage.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerBackgroundImage.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerBackgroundImage.heightAnchor.constraint(equalTo: headerView.heightAnchor),
            headerBackgroundImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            
            loginLogo.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: -90),
            loginLogo.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            loginLogo.heightAnchor.constraint(equalToConstant: 35),
            loginLogo.widthAnchor.constraint(equalToConstant: 35),
            
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 20),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            bottomView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            bottomView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 45),
            
            emailLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            
            emailTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 25),
            
            passwordLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 35),
            
            passwordTextField.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant:  -20),
            
            loginButton.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -20),
            
            forgotPasswordLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            forgotPasswordLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @objc func didTapButton () {
        let userProfileController = UserProfileViewController()
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(userProfileController, animated: true)
    }
    
    @objc func loginButtonPressed(){
        guard let userEmail = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if userEmail.isValidEmail == false {
            let alert = UIAlertController(title: "One moment!", message: "Please provide your email to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        if password == "" {
            let alert = UIAlertController(title: "One moment!", message: "Please provide your password to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else {
            didTapButton()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}




