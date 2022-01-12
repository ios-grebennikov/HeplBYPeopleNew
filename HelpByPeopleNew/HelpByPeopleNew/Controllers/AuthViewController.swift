//
//  AuthViewController.swift
//  HelpByPeopleNew
//
//  Created by Alexey Grebennikov on 10.01.22.
//

import UIKit
import SnapKit

class AuthViewController: UIViewController, Routable {
    
    //MARK: - Properties
    
    var router: MainRouter?
    
    //MARK: - UI Elements
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.textColor = .red
        label.font = UIFont(name: "Rockwell Bold", size: 36)
        return label
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rockwell", size: 20)
        button.tintColor = .white
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "helpBackground")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let notMemberRegisterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.contentMode = .scaleToFill
        return stackView
    }()
    
    private let memberLabel: UILabel = {
        let label = UILabel()
        label.text = "You are not a member?"
        label.font = UIFont(name: "Rockwell", size: 17)
        label.tintColor = .black
        return label
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "Rockwell Bold", size: 20)
        button.tintColor = .red
        button.addTarget(self, action: #selector(registerButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Private Utils
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(backgroundImageView)
        view.addSubview(notMemberRegisterStackView)
        notMemberRegisterStackView.addSubview(memberLabel)
        notMemberRegisterStackView.addSubview(registerButton)
    }
    
    private func setupConstraints() {
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalTo(passwordTextField)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
        backgroundImageView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
        }
        
        notMemberRegisterStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(30)
            
        }
        
        memberLabel.snp.makeConstraints { make in
            make.left.equalTo(notMemberRegisterStackView.snp.left).offset(20)
            make.centerY.equalTo(notMemberRegisterStackView)
        }
        
        registerButton.snp.makeConstraints { make in
            make.right.equalTo(notMemberRegisterStackView.snp.right).offset(-20)
            make.centerY.equalTo(memberLabel)
        }
        
        
    }
    
    @objc private func registerButtonDidTap() {
        print("goToRegisterVC")
        router?.pushRegisterVC()
        
    }
    
    @objc private func loginButtonDidTap() {
        print("loginButtonDidTap")
    }
    
    
}
