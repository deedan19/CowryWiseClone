
import UIKit

class SignUpViewController: UIViewController {
    private var horizontalLine = HorizontalLine()
    private var exploreController: ExploreViewController!
    private let color = HexColourDelegate()
    
    private var titleLabel: UILabel!
    private var firstNameTextField: UITextField!
    private var lastNameTextField: UITextField!
    private var passwordTextField: UITextField!
    private var passwordIcon: UIButton!
    private var phoneNumberTextfield: UITextField!
    private var continueButton: UIButton!
    private var inviteLabel: UILabel!
    private var termsAndConditionLabel: UILabel!
    private var tAndC: UILabel!
    private var PandP: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        passwordTextField.delegate = self
        phoneNumberTextfield.delegate = self
        initializeHideKeyboard()
    }
    
    override func loadView() {
        super.loadView()
        view = UIView()
        view.backgroundColor = .white
        
        
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont(name: "Helvetica", size: 30)
        titleLabel.text = "Let's get to know you."
        titleLabel.alpha = 0.8
        view.addSubview(titleLabel)
        
        
        
        //Firstname
        firstNameTextField = UITextField()
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.placeholder = "Firstname"
        firstNameTextField.font = UIFont.italicSystemFont(ofSize: 20)
        firstNameTextField.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(firstNameTextField)
        
        // Lastname
        lastNameTextField = UITextField()
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.placeholder = "Surname"
        lastNameTextField.font = UIFont.italicSystemFont(ofSize: 20)
        lastNameTextField.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(lastNameTextField)
        
        // Password
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont.italicSystemFont(ofSize: 20)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(passwordTextField)
        
        //Password Icon
        passwordIcon = UIButton()
        passwordIcon.translatesAutoresizingMaskIntoConstraints = true
        passwordIcon.setImage(UIImage(named: "eye"), for: .normal)
        passwordIcon.backgroundColor = color.black
        passwordIcon.alpha = 0.6
        
        // Phone Number
        phoneNumberTextfield = UITextField()
        phoneNumberTextfield.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTextfield.placeholder = "Phone Number"
        phoneNumberTextfield.font = UIFont.italicSystemFont(ofSize: 20)
        phoneNumberTextfield.addLine(position: .bottom, color: color.grey, width: 1)
        view.addSubview(phoneNumberTextfield)
        
        
        // Continue Button
        continueButton = UIButton()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("CONTINUE", for: .normal)
        continueButton.titleLabel?.font = .systemFont(ofSize: 20)
        continueButton.backgroundColor = color.blue
        continueButton.layer.cornerRadius = 10
        view.addSubview(continueButton)
        continueButton.addTarget(self, action: #selector(continueButtonPressed), for: .touchUpInside) //didTapButton
        
        // Got an invite code?
        inviteLabel = UILabel()
        inviteLabel.translatesAutoresizingMaskIntoConstraints = false
        inviteLabel.font = UIFont(name: "Helvetica", size: 17)
        inviteLabel.text = "Got an invite code?"
        inviteLabel.textColor = color.blue
        view.addSubview(inviteLabel)
        
        // Terms and Condition
        termsAndConditionLabel = UILabel()
        termsAndConditionLabel.numberOfLines = 0
        termsAndConditionLabel.textAlignment = .center
        termsAndConditionLabel.translatesAutoresizingMaskIntoConstraints = false
        termsAndConditionLabel.font = UIFont(name: "Helvetica", size: 17)
        tAndC = UILabel()
        PandP = UILabel()
        tAndC.translatesAutoresizingMaskIntoConstraints = false
        PandP.translatesAutoresizingMaskIntoConstraints = false
        tAndC.text = "Terms and Conditions"
        PandP.text = "Privacy Poliicy"
        tAndC.addLine(position: .bottom, color: color.grey, width: 1)
        termsAndConditionLabel.text = "By signing up you agree to our \(String(describing: tAndC.text!)) and \(String(describing: PandP.text!))"
        termsAndConditionLabel.alpha = 0.5
        view.addSubview(termsAndConditionLabel)
        
        
        [titleLabel, firstNameTextField, lastNameTextField, passwordTextField, passwordIcon, phoneNumberTextfield, continueButton, inviteLabel, termsAndConditionLabel, horizontalLine].forEach{view.addSubview($0)}
        
        // SetUp Constraints
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            firstNameTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            firstNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            firstNameTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.45, constant: -20),
            
            
            lastNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            lastNameTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            lastNameTextField.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.45),
            
            passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            passwordTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 70),
            passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant:  -20),
            
            phoneNumberTextfield.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            phoneNumberTextfield.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 70),
            phoneNumberTextfield.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant:  -20),
            
            continueButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            continueButton.topAnchor.constraint(equalTo: phoneNumberTextfield.bottomAnchor, constant: 100),
            continueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 60),
            
            inviteLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            inviteLabel.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 100),
            
            termsAndConditionLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            termsAndConditionLabel.topAnchor.constraint(equalTo: inviteLabel.bottomAnchor, constant: 20),
            termsAndConditionLabel.widthAnchor.constraint(equalToConstant: 350)
            
        ])
    }
    
    // Navigate to explore controller
    @objc func didTapButton () {
        exploreController = ExploreViewController()
        let navVC = UINavigationController(rootViewController: exploreController)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .flipHorizontal
        present(navVC, animated: true, completion: nil)
    }
    
    // Continue Button
    @objc func continueButtonPressed(){
        guard let firstName = firstNameTextField.text?.lowercased() else { return }
        guard let lastName = lastNameTextField.text?.lowercased() else { return }
        guard let password = passwordTextField.text?.lowercased() else { return }
        guard let phoneNumber = phoneNumberTextfield.text?.lowercased() else { return }
        
        if firstName == "" || lastName == ""{
            let alert = UIAlertController(title: "Ooops Sorry", message: "Please provide a your name to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        if firstName.count < 1 || lastName.count < 1 {
            let alert = UIAlertController(title: "Ooops Sorry", message: "Please provide a valid name to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if password == "" {
            let alert = UIAlertController(title: "One moment", message: "Please set a password to continue", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }else if password.count < 8 {
            let alert = UIAlertController(title: "Ooops Sorry", message: "Password must be a minimum of 8 characters and must contain numbers and alphabets", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if phoneNumber.count < 9 {
            let alert = UIAlertController(title: "Ooops Sorry", message: "Please provide a valid phone number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            didTapButton()
        }
        
        //MARK: - Sign Up
        
        func userSignUp () {
            let rootView = RootViewController()
            
            let email = rootView.inputEmailTextField.text!
            print(email)
            let parameters = ["email":email,"password": password,"firstName":firstName,"lastName":lastName,"phoneNumber":phoneNumber] as [String : Any]
            let url = "https://609908f199011f001713ffb0.mockapi.io/api/v1/signup"
            guard let signUpUrl = URL(string: url) else { return }
            var request = URLRequest(url: signUpUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            let session = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("There was an error: \(error.localizedDescription)")
                } else {
                    let jsonResponse = try? JSONSerialization.jsonObject(with: data!, options: [])
                    print("The response is \(String(describing: jsonResponse))")
                }
            }
            session.resume()
        }
        
    }
    
}

//MARK: - Phone Number TextField Delegate
extension SignUpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneNumberTextfield {
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789")
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
}

extension SignUpViewController {
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



