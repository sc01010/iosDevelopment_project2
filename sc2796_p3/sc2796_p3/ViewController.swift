//
//  ViewController.swift
//  sc2796_p3
//
//  Created by Steven Chen on 10/9/21.
//

import UIKit

protocol UpdateProfilePicDelegate: class {
    func updateProfilePic(newImage: UIImage)
}

protocol UpdateProfileInfoDelegate: class {
    func updateName(newNameString: String)
    func updatePortfolio(newPortfolioString: String)
    func updateAge(newAgeString: String)
    func updateAbout(newAboutString: String)
}

class ViewController: UIViewController {

    private var editProfileButton = UIButton()
    private var editProfilePicButton = UIButton()
    private var nameLabel = UILabel()
    private var portfolioLabel = UILabel()
    private var ageLabel = UILabel()
    private var aboutTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "My Profile"
        view.backgroundColor = .white
        
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        editProfileButton.setTitle("Edit My Profile", for: .normal)
        editProfileButton.setTitleColor(.blue, for: .normal)
        editProfileButton.backgroundColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
        editProfileButton.layer.cornerRadius = 5
        editProfileButton.addTarget(self, action: #selector(editProfileButtonPressed), for: .touchUpInside)
        view.addSubview(editProfileButton)
        
        let profilePicImage = UIImage(named: "avatarSix")
        editProfilePicButton.translatesAutoresizingMaskIntoConstraints = false
        editProfilePicButton.setBackgroundImage(profilePicImage, for: UIControl.State.normal)
        editProfilePicButton.addTarget(self, action: #selector(profilePicButtonPressed), for: .touchUpInside)
        view.addSubview(editProfilePicButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Jamie Gonzalez"
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        view.addSubview(nameLabel)
        
        portfolioLabel.translatesAutoresizingMaskIntoConstraints = false
        portfolioLabel.text = "JamieG.com"
        portfolioLabel.adjustsFontSizeToFitWidth = true
        portfolioLabel.textColor = .black
        portfolioLabel.textAlignment = .center
        portfolioLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.addSubview(portfolioLabel)
        
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        ageLabel.text = "6 years old"
        ageLabel.textColor = .black
        ageLabel.textAlignment = .center
        ageLabel.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(ageLabel)

        aboutTextView.translatesAutoresizingMaskIntoConstraints = false
        aboutTextView.text = "Hi, I'm Jamie and I enjoy skiing, sledding, and squirrel watching."
        aboutTextView.textColor = .black
        aboutTextView.textAlignment = .left
        aboutTextView.font = UIFont.systemFont(ofSize: 18)
        aboutTextView.isUserInteractionEnabled = true
        aboutTextView.isScrollEnabled = true
        aboutTextView.isEditable = false
        view.addSubview(aboutTextView)
        
        setUpViews()
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate ([
            editProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            editProfileButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -26),
            editProfileButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            editProfilePicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editProfilePicButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editProfilePicButton.heightAnchor.constraint(equalToConstant: 150),
            editProfilePicButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: editProfilePicButton.bottomAnchor, constant: 5),
//            nameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            portfolioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            portfolioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            portfolioLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            portfolioLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            ageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ageLabel.topAnchor.constraint(equalTo: portfolioLabel.bottomAnchor, constant: 5),
            ageLabel.widthAnchor.constraint(equalToConstant: 120),
            ageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            aboutTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            aboutTextView.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 20),
            aboutTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            aboutTextView.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            aboutTextView.heightAnchor.constraint(equalToConstant: 500),
            aboutTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            aboutTextView.bottomAnchor.constraint(equalTo: editProfileButton.topAnchor, constant: -10)
        ])
    }
    
    @objc func editProfileButtonPressed() {
        let newViewController = EditProfileViewController(delegate: self, placeholderNameText: nameLabel.text ?? "Jamie Gonzalez", placeholderPortfolioText: portfolioLabel.text ?? "jamieG.com", placeholderAgeText: ageLabel.text ?? "6 years old", placeholderAboutText: aboutTextView.text ?? "Hi, I'm Jamie and I enjoy skiing, sledding, and squirrel watching.")
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func profilePicButtonPressed() {
        let newViewController = EditProfilePicViewController(delegate: self, placeholderImage: editProfilePicButton.currentBackgroundImage!)
//        The following line of code is to make the presented view controller go into fullscreen mode just like in the example
        newViewController.modalPresentationStyle = .overFullScreen
        present(newViewController, animated: true, completion: nil)
    }

}

extension ViewController: UpdateProfilePicDelegate {
    
    func updateProfilePic(newImage: UIImage) {
        editProfilePicButton.setBackgroundImage(newImage, for: UIControl.State.normal)
    }
    
}

extension ViewController: UpdateProfileInfoDelegate {
    func updateName(newNameString: String) {
        nameLabel.text = newNameString
    }
    
    func updatePortfolio(newPortfolioString: String) {
        portfolioLabel.text = newPortfolioString
    }
    
    func updateAge(newAgeString: String) {
        ageLabel.text = newAgeString
    }
    
    func updateAbout(newAboutString: String) {
        aboutTextView.text = newAboutString
    }
    
    
}
