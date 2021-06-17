//
//  RootViewController.swift
//  CowrywiseProject
//
//  Created by Decagon on 08/05/2021.
//

import UIKit


class RootViewController: UIViewController {
    private var loginViewController: LoginViewController!
    private let horizontalLine = HorizontalLine()
    private let color = HexColourDelegate()
    
    private var rootTopView: UIView!
    private var logo: UIImageView!
    public var inputEmailTextField: UITextField!
    private var cowryWiseLabel: UILabel!
    private var getStartedButton: UIButton!
    private var rootBottomView: UIView!
    private var titleLabel: UILabel!
    private var emailLabel: UILabel!
    private var bottomLabel: UILabel!
    private var bottomLabelButton: UIButton!
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = color.blue
        
        // Start page top view
        rootTopView = UIView()
        rootTopView.translatesAutoresizingMaskIntoConstraints = false
        
        // Start page logo
        logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFit
        logo.image = #imageLiteral(resourceName: "cowrywiselogo")
        logo.backgroundColor = color.white
        
        // Start page home label
        cowryWiseLabel = UILabel()
        cowryWiseLabel.translatesAutoresizingMaskIntoConstraints = false
        cowryWiseLabel.font = UIFont(name: "Helvetica", size: 35)
        cowryWiseLabel.font = UIFont.boldSystemFont(ofSize: 35)
        cowryWiseLabel.text = "cowrywise"
        cowryWiseLabel.textColor = color.white
        rootTopView.addSubview(cowryWiseLabel)
        
        // Start page bottom view
        rootBottomView = UIView()
        rootBottomView.translatesAutoresizingMaskIntoConstraints = false
        rootBottomView.backgroundColor = color.white
        
        
        //Title Label
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.text = "Let's get your money working"
        titleLabel.alpha = 0.7
        
        // email label
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.font = UIFont.systemFont(ofSize: 15)
        emailLabel.alpha = 0.5
        emailLabel.text = "Type in your email"
        
        // Text field
        inputEmailTextField = UITextField()
        inputEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        inputEmailTextField.placeholder = "                 "
        inputEmailTextField.font = UIFont.italicSystemFont(ofSize: 17)
        
        
        // Get started Button
        getStartedButton = UIButton()
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.titleLabel?.font = .systemFont(ofSize: 20)
        getStartedButton.backgroundColor = color.blue
        getStartedButton.layer.cornerRadius = 10
        getStartedButton.addTarget(self, action: #selector(getStartedButtonPressed), for: .touchUpInside)  // didTapButton
        
        
        //Got an account label
        bottomLabel = UILabel()
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Got an account?"
        bottomLabel.alpha = 0.7
        bottomLabel.font = UIFont.systemFont(ofSize: 15)
        
        //SignIn Label Link
        bottomLabelButton = UIButton()
        bottomLabelButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLabelButton.setTitle("Sign In", for: .normal)
        bottomLabelButton.setTitleColor(color.blue, for: .normal)
        bottomLabelButton.titleLabel?.font = .systemFont(ofSize: 15)
        bottomLabelButton.titleColor(for: .normal)
        bottomLabelButton.addTarget(self, action: #selector(toLoginPage), for: .touchUpInside)
        
        //Views
        [titleLabel, emailLabel, inputEmailTextField, getStartedButton, bottomLabel, bottomLabelButton, horizontalLine].forEach{ rootBottomView.addSubview($0)}
        [rootTopView, rootBottomView, logo].forEach {view.addSubview($0)}
        
        
        //MARK: - Layout Constraints
        let safeArea = view.safeAreaLayoutGuide
        horizontalLine.anchor(top: inputEmailTextField.bottomAnchor, leading: safeArea.leadingAnchor, bottom: nil, trailing: safeArea.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20))
        
        
        NSLayoutConstraint.activate([
            //
            rootTopView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor),
            rootTopView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            rootTopView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            rootTopView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            
            logo.centerXAnchor.constraint(equalTo: rootTopView.centerXAnchor, constant: -90),
            logo.centerYAnchor.constraint(equalTo: rootTopView.centerYAnchor),
            logo.heightAnchor.constraint(equalToConstant: 35),
            logo.widthAnchor.constraint(equalToConstant: 35),
            
            cowryWiseLabel.centerXAnchor.constraint(equalTo: rootTopView.centerXAnchor, constant: 20),
            cowryWiseLabel.centerYAnchor.constraint(equalTo: rootTopView.centerYAnchor),
            
            rootBottomView.leadingAnchor.constraint(equalTo:  safeArea.leadingAnchor),
            rootBottomView.topAnchor.constraint(equalTo: rootTopView.bottomAnchor),
            rootBottomView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            rootBottomView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.5),
            
            titleLabel.leadingAnchor.constraint(equalTo: rootBottomView.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: rootBottomView.topAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: rootBottomView.trailingAnchor, constant:  -10),
            
            emailLabel.leadingAnchor.constraint(equalTo: rootBottomView.leadingAnchor, constant: 20),
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            emailLabel.trailingAnchor.constraint(equalTo: rootBottomView.trailingAnchor, constant: 10),
            
            inputEmailTextField.leadingAnchor.constraint(equalTo: rootBottomView.leadingAnchor, constant: 20),
            inputEmailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            
            getStartedButton.leadingAnchor.constraint(equalTo: rootBottomView.leadingAnchor, constant: 20),
            getStartedButton.topAnchor.constraint(equalTo: inputEmailTextField.bottomAnchor, constant: 100),
            getStartedButton.trailingAnchor.constraint(equalTo: rootBottomView.trailingAnchor, constant: -20),
            getStartedButton.heightAnchor.constraint(equalToConstant: 55),
            
            bottomLabel.centerXAnchor.constraint(equalTo: rootBottomView.centerXAnchor, constant: -30),
            bottomLabel.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 15),
            
            bottomLabelButton.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 9),
            bottomLabelButton.centerXAnchor.constraint(equalTo: rootBottomView.centerXAnchor, constant: 60)
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeHideKeyboard()
        inputEmailTextField.delegate = self
    }
    
    
    //Already have an account?
    @objc func toLoginPage () {
        loginViewController = LoginViewController()
        let navVC = UINavigationController(rootViewController: loginViewController)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .crossDissolve
        present(navVC, animated: true, completion: nil)
    }
    
    @objc private func didTapButton () {
        let signUpController = SignUpViewController()
        navigationController?.pushViewController(signUpController, animated: true)
        signUpController.modalPresentationStyle = .fullScreen
        present(signUpController, animated: true, completion: nil)
    }
    
    
    @objc func getStartedButtonPressed(){
        guard let userEmail = inputEmailTextField.text?.lowercased() else {return}
        if userEmail == "" {
            let alert = UIAlertController(title: "Ooops Sorry", message: "Please provide your email to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
        if userEmail.isValidEmail == false {
            let alert = UIAlertController(title: "Ooops Sorry", message: "Please provide a valid email to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else if userEmail == "" {
            let alert = UIAlertController(title: "Ooops Sorry", message: "Please provide your email to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        else  {
            didTapButton()
        }
    }
}

extension RootViewController: UITextFieldDelegate {
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

