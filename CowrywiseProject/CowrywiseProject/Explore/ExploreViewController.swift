//
//  ExploreViewController.swift
//  CowrywiseProject
//
//  Created by Decagon on 09/05/2021.
//

import UIKit

class ExploreViewController: UIViewController {
    private var loginController: LoginViewController!
    
    private let color = HexColourDelegate()
    private  var exploreImage: UIImageView!
    private var titleLabel: UILabel!
    private  var welcomeLabel: UILabel!
    private var exploreButton: UIButton!
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = color.white
        
        // Explore background Image
        exploreImage = UIImageView()
        exploreImage.translatesAutoresizingMaskIntoConstraints = false
        exploreImage.contentMode = .scaleAspectFill
        exploreImage.image = #imageLiteral(resourceName: "img")
        exploreImage.backgroundColor = color.white
        view.addSubview(exploreImage)
        
        // Explore Title label
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Helvetica", size: 35)
        titleLabel.text = "You're all set!"
        titleLabel.alpha = 0.8
        view.addSubview(titleLabel)
        
        // Explore welcome label
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = UIFont(name: "Helvetica", size: 17)
        welcomeLabel.text = "Welcome to the family"
        welcomeLabel.alpha = 0.5
        view.addSubview(welcomeLabel)
        
        
        exploreButton = UIButton()
        exploreButton.translatesAutoresizingMaskIntoConstraints = false
        exploreButton.setTitle("EXPLORE COWRYWISE", for: .normal)
        exploreButton.titleLabel?.font = .systemFont(ofSize: 17)
        exploreButton.backgroundColor = color.blue
        exploreButton.layer.cornerRadius = 10
        exploreButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)  // didTapButton
        view.addSubview(exploreButton)
        
        
        // Constraints
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            exploreImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            exploreImage.topAnchor.constraint(equalTo: safeArea.topAnchor),
            exploreImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            exploreImage.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -150),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            welcomeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
        
            exploreButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            exploreButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            exploreButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            exploreButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @objc func didTapButton () {
        loginController = LoginViewController()
        let navVC = UINavigationController(rootViewController: loginController)
        //        navigationController?.pushViewController(signUpController, animated: true)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .flipHorizontal
        present(navVC, animated: true, completion: nil)
    }
    
}
