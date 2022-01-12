//
//  RegisterViewController.swift
//  HelpByPeopleNew
//
//  Created by Alexey Grebennikov on 10.01.22.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController, Routable {
    
    //MARK: - Properties
    
    var router: MainRouter?
    
    //MARK: - UI Elements
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "add-image")
        return imageView
    }()
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Photo", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Demi Bold", size: 17)
        button.tintColor = .red
        button.addTarget(self, action: #selector(addPhotoButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e-mail"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .next
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.style = .large
        indicator.color = .red
        return indicator
    }()


    

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false
        
        
     
        setupViews()
        setupConstraints()
        setupNavigationBar()
    }
    

    //MARK: - Private Utils
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(photoImageView)
        view.addSubview(addPhotoButton)
        view.addSubview(userNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(activityIndicatorView)
    }
  
    
    private func setupConstraints() {
        
        photoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(50)
            
        }
        
        addPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.centerX.equalTo(photoImageView)
        }
            
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(addPhotoButton.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        activityIndicatorView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "New User"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidTap))
    }
    
    //MARK: - Private Actions
    
    @objc private func cancelButtonDidTap() {
        router?.back()
    }
    
    @objc private func saveButtonDidTap() {
        print("saveButtonDidTap")
    }
    
    @objc private func addPhotoButtonDidTap() {
        print("addPhotoButtonDidTap")
    }

}


//activityIndicatorView.startAnimating()
