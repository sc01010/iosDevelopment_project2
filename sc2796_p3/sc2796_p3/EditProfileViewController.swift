//
//  EditProfileViewController.swift
//  sc2796_p3
//
//  Created by Steven Chen on 10/9/21.
//

import UIKit

class EditProfileViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: UpdateProfileInfoDelegate?
    
    private var nameLabel = UILabel()
    private var nameTextField = UITextField()
    private var portfolioLabel = UILabel()
    private var portfolioTextField = UITextField()
    private var ageLabel = UILabel()
    private var ageSlider = UISlider()
    private var ageOutputLabel = UILabel()
    private var aboutLabel = UILabel()
    private var aboutTextView = UITextView()
    private var saveButton = UIButton()
    private var ageNumFloat :Float
    
    var placeholderNameText: String?
    var placeholderPortfolioText: String?
    var placeholderAgeText: String?
    var placeholderAboutText: String?
    
    init(delegate: UpdateProfileInfoDelegate?, placeholderNameText: String, placeholderPortfolioText: String, placeholderAgeText: String, placeholderAboutText: String) {
        self.delegate = delegate
        self.placeholderNameText = placeholderNameText
        self.placeholderPortfolioText = placeholderPortfolioText
        self.placeholderAgeText = placeholderAgeText
        self.placeholderAboutText = placeholderAboutText
        self.ageNumFloat = 0.0
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let number = Float(placeholderAgeText!.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()) {
            ageNumFloat = number
        }
        
        view.backgroundColor = .white
        title = "Edit My Profile"
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "NAME"
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textAlignment = .left
        nameTextField.text = placeholderNameText!
        nameTextField.textColor = .black
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.blue.cgColor
        
        let namePaddingView: UIView = UIView(frame: CGRect(x: 10, y: 0, width: 5, height: 20))
        nameTextField.leftView = namePaddingView
        nameTextField.leftViewMode = .always
        
        view.addSubview(nameTextField)
        
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        portfolioLabel.text = "PORTFOLIO"
        portfolioLabel.font = UIFont.systemFont(ofSize: 12)
        portfolioLabel.textColor = .black
        view.addSubview(portfolioLabel)
        
        portfolioTextField.translatesAutoresizingMaskIntoConstraints = false
        portfolioTextField.textAlignment = .left
        portfolioTextField.text = placeholderPortfolioText!
        portfolioTextField.textColor = .black
        portfolioTextField.layer.borderWidth = 1
        portfolioTextField.layer.borderColor = UIColor.blue.cgColor
        
        let portfolioPaddingView: UIView = UIView(frame: CGRect(x: 10, y: 0, width: 5, height: 20))
        portfolioTextField.leftView = portfolioPaddingView
        portfolioTextField.leftViewMode = .always
        
        view.addSubview(portfolioTextField)
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "AGE"
        ageLabel.font = UIFont.systemFont(ofSize: 12)
        ageLabel.textColor = .black
        view.addSubview(ageLabel)
        
        
        ageSlider.translatesAutoresizingMaskIntoConstraints = false
        ageSlider.minimumValue = 6
        ageSlider.maximumValue = 140
        ageSlider.value = ageNumFloat
        ageSlider.setValue(ageNumFloat, animated: true)
        ageSlider.minimumTrackTintColor = .blue
        ageSlider.maximumTrackTintColor = .brown
        ageSlider.thumbTintColor = .lightGray
        ageSlider.addTarget(self, action: #selector(ageSliderChange(slider:)), for: .valueChanged)
        view.addSubview(ageSlider)
        
        ageOutputLabel.translatesAutoresizingMaskIntoConstraints = false
        ageOutputLabel.text = placeholderAgeText!
        ageOutputLabel.textAlignment = .center
        ageOutputLabel.font = UIFont.systemFont(ofSize: 12)
        ageOutputLabel.textColor = .black
        view.addSubview(ageOutputLabel)
        
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.text = "ABOUT"
        aboutLabel.font = UIFont.systemFont(ofSize: 12)
        aboutLabel.textColor = .black
        view.addSubview(aboutLabel)
        
        aboutTextView.translatesAutoresizingMaskIntoConstraints = false
        aboutTextView.text = placeholderAboutText!
        aboutTextView.backgroundColor = .white
        aboutTextView.layer.borderWidth = 2
        aboutTextView.layer.borderColor = .init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        aboutTextView.font = UIFont.systemFont(ofSize: 12)
        aboutTextView.isEditable = true
        aboutTextView.isScrollEnabled = true
        view.addSubview(aboutTextView)
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blue, for: .normal)
        saveButton.backgroundColor = UIColor(red: 10/255, green: 100/255, blue: 5/255, alpha: 1)
        saveButton.layer.cornerRadius = 3
        saveButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        if (nameTextField.text!.count == 0) {
            saveButton.isUserInteractionEnabled = false
        }
        view.addSubview(saveButton)
        
        setupViews()
    }
    
    func setupViews() {
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            nameLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            nameTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            portfolioLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            portfolioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portfolioLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            portfolioLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            portfolioTextField.topAnchor.constraint(equalTo: portfolioLabel.bottomAnchor, constant:5),
            portfolioTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portfolioTextField.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            portfolioTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.topAnchor.constraint(equalTo: portfolioTextField.bottomAnchor, constant: 10),
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            ageLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ageSlider.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5),
            ageSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageSlider.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            ageSlider.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ageOutputLabel.topAnchor.constraint(equalTo: ageSlider.bottomAnchor, constant: 5),
            ageOutputLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageOutputLabel.widthAnchor.constraint(equalToConstant: 130),
            ageOutputLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            aboutLabel.topAnchor.constraint(equalTo: ageOutputLabel.bottomAnchor, constant: 5),
            aboutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            aboutLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            aboutTextView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 5),
            aboutTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutTextView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -10),
            aboutTextView.widthAnchor.constraint(equalTo: nameLabel.widthAnchor)
        ])
        
    }
    
    
    @objc func ageSliderChange(slider:UISlider){
        let currentAge = Int(slider.value)
        ageOutputLabel.text = "\(currentAge) years old"
    }
    
    @objc func popViewController() {
//        The data validation that I have implemented is making sure that the Name field, Portfolio field, and the About field are not left empty. Since the Age slider already had a default value, I did not test if the age output was left empty or not.
        if saveButton.isTouchInside && nameTextField.text != "" && portfolioTextField.text != "" && aboutTextView.text != ""{
            delegate?.updateName(newNameString: nameTextField.text ?? "Jamie Gonzalez")
            delegate?.updatePortfolio(newPortfolioString: portfolioTextField.text ?? "jamieG.com")
            delegate?.updateAge(newAgeString: ageOutputLabel.text ?? "6 years old")
            delegate?.updateAbout(newAboutString: aboutTextView.text ?? "Hi, I'm Jamie and I enjoy skiing, sledding, and squirrel watching.")
            navigationController?.popViewController(animated: true)
        } else if saveButton.isTouchInside && nameTextField.text == ""{
//          Source: https://www.appsdeveloperblog.com/how-to-show-an-alert-in-swift/
            let dialogMessage = UIAlertController(title: "Name Field is Empty", message: "Please make sure to fill out your name.", preferredStyle: .alert)

            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
            })

            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        } else if saveButton.isTouchInside && portfolioTextField.text == ""{
//          Source: https://www.appsdeveloperblog.com/how-to-show-an-alert-in-swift/
            let dialogMessage = UIAlertController(title: "Portfolio Field is Empty", message: "Please make sure to include a URL link to your portfolio.", preferredStyle: .alert)

            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
            })

            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        } else if saveButton.isTouchInside && aboutTextView.text == "" {
//          Source: https://www.appsdeveloperblog.com/how-to-show-an-alert-in-swift/
            let dialogMessage = UIAlertController(title: "About Field is Empty", message: "Please make sure to include a short introduction about yourself.", preferredStyle: .alert)

            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
            })

            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
