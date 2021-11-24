//
//  EditProfilePicViewController.swift
//  sc2796_p3
//
//  Created by Steven Chen on 10/9/21.
//

import UIKit

class EditProfilePicViewController: UIViewController {
    
    weak var delegate: UpdateProfilePicDelegate?
    
    private var mainProfilePicImageView = UIImageView()
    private var avatarOneButton = UIButton()
    private var avatarTwoButton = UIButton()
    private var avatarThreeButton = UIButton()
    private var avatarFourButton = UIButton()
    private var avatarFiveButton = UIButton()
    private var avatarSixButton = UIButton()
    private var closeButton = UIButton()
    private var saveButton = UIButton()
    
    var placeholderImage: UIImage?
    
    init(delegate: UpdateProfilePicDelegate?, placeholderImage: UIImage) {
        self.delegate = delegate
        self.placeholderImage = placeholderImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Change My Picture"
        // Do any additional setup after loading the view.
        
        mainProfilePicImageView.translatesAutoresizingMaskIntoConstraints = false
        mainProfilePicImageView.image = placeholderImage
        view.addSubview(mainProfilePicImageView)
        
        let avatarOneImage = UIImage(named: "avatarOne")
        avatarOneButton.translatesAutoresizingMaskIntoConstraints = false
        avatarOneButton.setBackgroundImage(avatarOneImage, for: UIControl.State.normal)
        avatarOneButton.addTarget(self, action: #selector(avatarOneButtonPressed), for: .touchUpInside)
        view.addSubview(avatarOneButton)
        
        let avatarTwoImage = UIImage(named: "avatarTwo")
        avatarTwoButton.translatesAutoresizingMaskIntoConstraints = false
        avatarTwoButton.setBackgroundImage(avatarTwoImage, for: UIControl.State.normal)
        avatarTwoButton.addTarget(self, action: #selector(avatarTwoButtonPressed), for: .touchUpInside)
        view.addSubview(avatarTwoButton)
        
        let avatarThreeImage = UIImage(named: "avatarThree")
        avatarThreeButton.translatesAutoresizingMaskIntoConstraints = false
        avatarThreeButton.setBackgroundImage(avatarThreeImage, for: UIControl.State.normal)
        avatarThreeButton.addTarget(self, action: #selector(avatarThreeButtonPressed), for: .touchUpInside)
        view.addSubview(avatarThreeButton)
        
        let avatarFourImage = UIImage(named: "avatarFour")
        avatarFourButton.translatesAutoresizingMaskIntoConstraints = false
        avatarFourButton.setBackgroundImage(avatarFourImage, for: UIControl.State.normal)
        avatarFourButton.addTarget(self, action: #selector(avatarFourButtonPressed), for: .touchUpInside)
        view.addSubview(avatarFourButton)
        
        let avatarFiveImage = UIImage(named: "avatarFive")
        avatarFiveButton.translatesAutoresizingMaskIntoConstraints = false
        avatarFiveButton.setBackgroundImage(avatarFiveImage, for: UIControl.State.normal)
        avatarFiveButton.addTarget(self, action: #selector(avatarFiveButtonPressed), for: .touchUpInside)
        view.addSubview(avatarFiveButton)
        
        let avatarSixImage = UIImage(named: "avatarSix")
        avatarSixButton.translatesAutoresizingMaskIntoConstraints = false
        avatarSixButton.setBackgroundImage(avatarSixImage, for: UIControl.State.normal)
        avatarSixButton.addTarget(self, action: #selector(avatarSixButtonPressed), for: .touchUpInside)
        view.addSubview(avatarSixButton)
        
        let cancelButtonImage = UIImage(named: "cancelButton")
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(cancelButtonImage, for: UIControl.State.normal)
        closeButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        view.addSubview(closeButton)
        
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.blue, for: .normal)
        saveButton.backgroundColor = UIColor(red: 10/255, green: 100/255, blue: 5/255, alpha: 1)
        saveButton.layer.cornerRadius = 3
        saveButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        view.addSubview(saveButton)
        
        setUpViews()
    }
    
    func setUpViews() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            mainProfilePicImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainProfilePicImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainProfilePicImageView.widthAnchor.constraint(equalToConstant: 200),
            mainProfilePicImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            avatarOneButton.topAnchor.constraint(equalTo: mainProfilePicImageView.bottomAnchor, constant: 50),
            avatarOneButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25),
            avatarOneButton.widthAnchor.constraint(equalToConstant: 120),
            avatarOneButton.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            avatarTwoButton.topAnchor.constraint(equalTo: mainProfilePicImageView.bottomAnchor, constant: 50),
            avatarTwoButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            avatarTwoButton.widthAnchor.constraint(equalToConstant: 120),
            avatarTwoButton.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            avatarThreeButton.topAnchor.constraint(equalTo: avatarOneButton.bottomAnchor, constant: 10),
            avatarThreeButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25),
            avatarThreeButton.widthAnchor.constraint(equalToConstant: 120),
            avatarThreeButton.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            avatarFourButton.topAnchor.constraint(equalTo: avatarTwoButton.bottomAnchor, constant: 10),
            avatarFourButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            avatarFourButton.widthAnchor.constraint(equalToConstant: 120),
            avatarFourButton.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            avatarFiveButton.topAnchor.constraint(equalTo: avatarThreeButton.bottomAnchor, constant: 10),
            avatarFiveButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25),
            avatarFiveButton.widthAnchor.constraint(equalToConstant: 120),
            avatarFiveButton.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            avatarSixButton.topAnchor.constraint(equalTo: avatarFourButton.bottomAnchor, constant: 10),
            avatarSixButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            avatarSixButton.widthAnchor.constraint(equalToConstant: 120),
            avatarSixButton.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    let avatarOneImage = UIImage(named: "avatarOne")
    let avatarTwoImage = UIImage(named: "avatarTwo")
    let avatarThreeImage = UIImage(named: "avatarThree")
    let avatarFourImage = UIImage(named: "avatarFour")
    let avatarFiveImage = UIImage(named: "avatarFive")
    let avatarSixImage = UIImage(named: "avatarSix")
    
    @objc func avatarOneButtonPressed() {
        mainProfilePicImageView.image = avatarOneImage
    }
    
    @objc func avatarTwoButtonPressed() {
        mainProfilePicImageView.image = avatarTwoImage
    }
    
    @objc func avatarThreeButtonPressed() {
        mainProfilePicImageView.image = avatarThreeImage
    }
    
    @objc func avatarFourButtonPressed() {
        mainProfilePicImageView.image = avatarFourImage
    }
    
    @objc func avatarFiveButtonPressed() {
        mainProfilePicImageView.image = avatarFiveImage
    }
    
    @objc func avatarSixButtonPressed() {
        mainProfilePicImageView.image = avatarSixImage
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissViewController() {
        delegate?.updateProfilePic(newImage: mainProfilePicImageView.image!)
        dismiss(animated: true, completion: nil)
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
