//
//  UserProfile.swift
//  CowrywiseProject
//
//  Created by Decagon on 09/05/2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    private let border = LinePosition.self
    private let color = HexColourDelegate()
    private var titleLabel: UILabel!
    
    private var segmentedControl: UISegmentedControl!
    private var profileImage: UIImageView!
    private var changeImageLabel: UILabel!
    private var firstNameView: UIView!
    private var lastNameView: UIView!
    private var userNameView: UIView!
    private var genderView: UIView!
    private var dobView: UIView!
    private var nextOfKinView: UIView!
    
    private var firstNameLabel: UILabel!
    private var userFirstName: UILabel!
    private var lastNameLabel: UILabel!
    private var userLastName: UILabel!
    private var userNameLabel: UILabel!
    private var userUserName: UILabel!
    private var genderLabel: UILabel!
    private var userGender: UILabel!
    private var dobLabel: UILabel!
    private var userDOB: UILabel!
    private var nextOKLabel: UILabel!
    private var userNextOK: UILabel!
    
    
    
    
    private func setTitle () -> String{
        let userTitle = "Profile"
        titleLabel = UILabel()
        titleLabel.text = userTitle
        titleLabel.font = UIFont(name: "Helvetica", size: 20)
        titleLabel.alpha = 0.8
        titleLabel.font = UIFont.boldSystemFont(ofSize: 10)
        return titleLabel.text ?? "hello world"
    }
    
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .white
        
        //Segmented Control
        segmentedControl = UISegmentedControl (items: ["Personal","Security","Behaviour"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.tintColor = color.blue
        segmentedControl.backgroundColor = color.grey
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(segmentedControl)
        
        
        // Views
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = #imageLiteral(resourceName: "Screenshot 2021-05-12 at 00.28.45")
        profileImage.layer.cornerRadius = 75
        profileImage.alpha = 0.8
        profileImage.backgroundColor = color.lightBlue
        profileImage.contentMode = .scaleAspectFit
        view.addSubview(profileImage)
        
        //Change Image Label
        changeImageLabel = UILabel()
        changeImageLabel.text = "Tap to change picture"
        changeImageLabel.translatesAutoresizingMaskIntoConstraints = false
        changeImageLabel.font = UIFont(name: "Helvetica", size: 10)
        changeImageLabel.alpha = 0.5
        view.addSubview(changeImageLabel)
        
        // Firstname
        firstNameView = UIView()
        firstNameView.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel = UILabel()
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.text = "Firstname"
        firstNameLabel.textColor = color.black
        firstNameLabel.font = UIFont(name: "Helvetica", size: 20)
        userFirstName = UILabel()
        userFirstName.translatesAutoresizingMaskIntoConstraints = false
        userFirstName.text = "aries"
        userFirstName.textColor = color.black
        userFirstName.alpha = 0.5
        userFirstName.font = UIFont(name: "Helvetica", size: 20)
        firstNameView.addSubview(firstNameLabel)
        firstNameView.addSubview(userFirstName)
        firstNameView.addLine(position: .top, color: color.grey, width: 1)
        firstNameView.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(firstNameView)
        
        //Lastname
        lastNameView = UIView()
        lastNameView.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel = UILabel()
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.text = "Lastname"
        lastNameLabel.textColor = color.black
        lastNameLabel.font = UIFont(name: "Helvetica", size: 20)
        userLastName = UILabel()
        userLastName.translatesAutoresizingMaskIntoConstraints = false
        userLastName.text = "prime"
        userLastName.textColor = color.black
        userLastName.alpha = 0.5
        userLastName.font = UIFont(name: "Helvetica", size: 20)
        lastNameView.addSubview(lastNameLabel)
        lastNameView.addSubview(userLastName)
        lastNameView.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(lastNameView)
        
        //Username
        userNameView = UIView()
        userNameView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel = UILabel()
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Username"
        userNameLabel.textColor = color.black
        userNameLabel.font = UIFont(name: "Helvetica", size: 20)
        userUserName = UILabel()
        userUserName.translatesAutoresizingMaskIntoConstraints = false
        userUserName.text = "@user12345"
        userUserName.textColor = color.black
        userUserName.alpha = 0.5
        userUserName.font = UIFont(name: "Helvetica", size: 20)
        userNameView.addSubview(userNameLabel)
        userNameView.addSubview(userUserName)
        userNameView.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(userNameView)
        
        // Gender
        genderView = UIView()
        genderView.translatesAutoresizingMaskIntoConstraints = false
        genderLabel = UILabel()
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender"
        genderLabel.textColor = color.black
        genderLabel.font = UIFont(name: "Helvetica", size: 20)
        userGender = UILabel()
        userGender.translatesAutoresizingMaskIntoConstraints = false
        userGender.text = "Gender"
        userGender.textColor = color.black
        userGender.alpha = 0.5
        userGender.font = UIFont(name: "Helvetica", size: 20)
        genderView.addSubview(userGender)
        genderView.addSubview(genderLabel)
        genderView.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(genderView)
        
        
        // Date of Birth
        dobView = UIView()
        dobView.translatesAutoresizingMaskIntoConstraints = false
        dobLabel = UILabel()
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        dobLabel.text = "Date of Birth"
        dobLabel.textColor = color.black
        dobLabel.font = UIFont(name: "Helvetica", size: 20)
        userDOB = UILabel()
        userDOB.translatesAutoresizingMaskIntoConstraints = false
        userDOB.text = "Date of Birth"
        userDOB.textColor = color.black
        userDOB.alpha = 0.5
        userDOB.font = UIFont(name: "Helvetica", size: 20)
        dobView.addSubview(userDOB)
        dobView.addSubview(dobLabel)
        dobView.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(dobView)
        
        //next of kin
        nextOfKinView = UIView()
        nextOfKinView.translatesAutoresizingMaskIntoConstraints = false
        nextOKLabel = UILabel()
        nextOKLabel.translatesAutoresizingMaskIntoConstraints = false
        nextOKLabel.text = "Next of Kin"
        nextOKLabel.textColor = color.black
        nextOKLabel.font = UIFont(name: "Helvetica", size: 20)
        userNextOK = UILabel()
        userNextOK.translatesAutoresizingMaskIntoConstraints = false
        userNextOK.text = ">"   // Icon
        userNextOK.textColor = color.black
        userNextOK.alpha = 0.5
        userNextOK.font = UIFont(name: "Helvetica", size: 20)
        nextOfKinView.addSubview(nextOKLabel)
        nextOfKinView.addSubview(userNextOK)
        nextOfKinView.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(nextOfKinView)
        
        //MARK: - NSLayoutConstraints
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40),
            segmentedControl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 50),
            
            profileImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            profileImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 150),
            
            changeImageLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            changeImageLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10),
            
            firstNameView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            firstNameView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            firstNameView.topAnchor.constraint(equalTo: changeImageLabel.bottomAnchor, constant: 60),
            firstNameView.heightAnchor.constraint(equalToConstant: 60),
            
            firstNameLabel.leadingAnchor.constraint(equalTo: firstNameView.leadingAnchor),
            firstNameLabel.centerYAnchor.constraint(equalTo: firstNameView.centerYAnchor),
            
            userFirstName.trailingAnchor.constraint(equalTo: firstNameView.trailingAnchor),
            userFirstName.centerYAnchor.constraint(equalTo: firstNameView.centerYAnchor),
            
            lastNameView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            lastNameView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            lastNameView.topAnchor.constraint(equalTo: firstNameView.bottomAnchor),
            lastNameView.heightAnchor.constraint(equalToConstant: 60),
            
            lastNameLabel.leadingAnchor.constraint(equalTo: lastNameView.leadingAnchor),
            lastNameLabel.centerYAnchor.constraint(equalTo: lastNameView.centerYAnchor),
            
            userLastName.trailingAnchor.constraint(equalTo: lastNameView.trailingAnchor),
            userLastName.centerYAnchor.constraint(equalTo: lastNameView.centerYAnchor),
            
            userNameView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            userNameView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            userNameView.topAnchor.constraint(equalTo: lastNameView.bottomAnchor),
            userNameView.heightAnchor.constraint(equalToConstant: 60),
            
            userNameLabel.leadingAnchor.constraint(equalTo: userNameView.leadingAnchor),
            userNameLabel.centerYAnchor.constraint(equalTo: userNameView.centerYAnchor),
            
            userUserName.trailingAnchor.constraint(equalTo: userNameView.trailingAnchor),
            userUserName.centerYAnchor.constraint(equalTo: userNameView.centerYAnchor),
            
            genderView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            genderView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            genderView.topAnchor.constraint(equalTo: userNameView.bottomAnchor),
            genderView.heightAnchor.constraint(equalToConstant: 60),
            
            genderLabel.leadingAnchor.constraint(equalTo: genderView.leadingAnchor),
            genderLabel.centerYAnchor.constraint(equalTo: genderView.centerYAnchor),
            
            userGender.trailingAnchor.constraint(equalTo: genderView.trailingAnchor),
            userGender.centerYAnchor.constraint(equalTo: genderView.centerYAnchor),
            
            dobView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            dobView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            dobView.topAnchor.constraint(equalTo: genderView.bottomAnchor),
            dobView.heightAnchor.constraint(equalToConstant: 60),
            
            dobLabel.leadingAnchor.constraint(equalTo: dobView.leadingAnchor),
            dobLabel.centerYAnchor.constraint(equalTo: dobView.centerYAnchor),
            
            userDOB.trailingAnchor.constraint(equalTo: dobView.trailingAnchor),
            userDOB.centerYAnchor.constraint(equalTo: dobView.centerYAnchor),
            
            nextOfKinView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            nextOfKinView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            nextOfKinView.topAnchor.constraint(equalTo: dobView.bottomAnchor),
            nextOfKinView.heightAnchor.constraint(equalToConstant: 60),
            
            nextOKLabel.leadingAnchor.constraint(equalTo: nextOfKinView.leadingAnchor),
            nextOKLabel.centerYAnchor.constraint(equalTo: nextOfKinView.centerYAnchor),
            
            userNextOK.trailingAnchor.constraint(equalTo: nextOfKinView.trailingAnchor),
            userNextOK.centerYAnchor.constraint(equalTo: nextOfKinView.centerYAnchor),
            
        ])
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        fetchUserProfile()
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    private func fetchUserProfile ()  {
        let profileURL = "https://609908f199011f001713ffb0.mockapi.io/api/v1/profile/2"
        URLSession.shared.dataTask(with: URL(string: profileURL)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            var json: UserProfileData?
            do {
                json = try JSONDecoder().decode(UserProfileData.self, from: data)
            }
            catch {
                print("error: \(error)")
            }
            guard let result = json else {
                return
            }
            DispatchQueue.main.async {
                self.userFirstName.text = result.firstName
                self.userLastName.text = result.lastName
                self.userUserName.text = result.userName
                self.userGender.text = String (result.gender)
                self.userDOB.text = result.dateOfBirth
                self.userNextOK.text = result.nextOfKin
            }
        }).resume()
    }
}

struct UserProfileData: Codable {
    var firstName: String
    var lastName: String
    var userName: String
    var gender: Bool
    var dateOfBirth: String
    var nextOfKin: String
    var email: String
    var phoneNumber: String
}

