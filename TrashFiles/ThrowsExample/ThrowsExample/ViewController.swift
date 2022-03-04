//
//  ViewController.swift
//  ThrowsExample
//
//  Created by Илья on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(magicButton)
        view.addSubview(login)
        view.addSubview(password)
        
        NSLayoutConstraint.activate([
            magicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            magicButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            magicButton.widthAnchor.constraint(equalToConstant: 200),
            magicButton.heightAnchor.constraint(equalToConstant: 50),
            
            login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            login.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            login.bottomAnchor.constraint(equalTo: magicButton.topAnchor, constant: -100),
            
            password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            password.bottomAnchor.constraint(equalTo: login.topAnchor, constant: 50),
        ])
    }

    private let magicButton: UIButton = {
        let button = UIButton()
        button.setTitle("CLICK", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()
    
    private let login: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let password: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    @objc private func actionButton() {
        
        do {
            try check()
        } catch ErrorAuth.emptyAll {
            print("Error: All empty.")
        } catch ErrorAuth.emptyLogin {
            print("Error: Login empty.")
        } catch ErrorAuth.emptyPassword {
            print("Error: Password empty.")
        } catch {
            print("Error: Unknown.")
        }
    }
    
    enum ErrorAuth: Error {
        case emptyAll
        case emptyLogin
        case emptyPassword
    }
    
    private func check() throws {
        
        let login = login.text!
        let password = password.text!
        
        if login.isEmpty && password.isEmpty {
            throw ErrorAuth.emptyAll
        }
        
        if login.isEmpty {
            throw ErrorAuth.emptyLogin
        }
        
        if password.isEmpty {
            throw ErrorAuth.emptyPassword
        }
        
        print("Success. Let's go.")
    }
}

