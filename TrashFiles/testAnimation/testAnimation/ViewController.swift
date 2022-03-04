//
//  ViewController.swift
//  testAnimation
//
//  Created by Илья on 01.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(viewBackground)
        view.addSubview(userImage)
        view.addSubview(cancelButton)
        activateContraints()
    }
    
    
    
    // MARK: Constants for avatar and it's background
    
    enum ConstraintsForAvatarAndItsBackground {
        
        // Avatar
        static var topSmallImage: NSLayoutConstraint?
        static var leadingSmallImage: NSLayoutConstraint?
        static var widthSmallImage: NSLayoutConstraint?
        static var heightSmallImage: NSLayoutConstraint?
        
        static var centerXBigImage: NSLayoutConstraint?
        static var centerYBigImage: NSLayoutConstraint?
        static var widthBigImage: NSLayoutConstraint?
        static var heightBigImage: NSLayoutConstraint?
        
        
        // Background avatar
        static var centerXSmallBackgroundView: NSLayoutConstraint?
        static var centerYSmallBackgroundView: NSLayoutConstraint?
        static var widthSmallBackgroundView: NSLayoutConstraint?
        static var heightSmallBackgroundView: NSLayoutConstraint?
        
        static var centerXBigBackgroundView: NSLayoutConstraint?
        static var centerYBigBackgroundView: NSLayoutConstraint?
        static var widthBigBackgroundView: NSLayoutConstraint?
        static var heightBigBackgroundView: NSLayoutConstraint?
    }

    
    
    // MARK: Private object's.
    
    private lazy var userImage: UIImageView = {
        var image = UIImageView(image: UIImage(named: "ImageTest"))
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.black.cgColor
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionByClickingOnAvatar)))
        return image
    }()
    
    let cancelButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    let viewBackground: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    // MARK: Private methods
    
    @objc func actionByClickingOnAvatar() {
        settingUpConstraintsForSmallImage()
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
            self.userImage.layer.borderWidth = 0
            self.userImage.layer.cornerRadius = 0
        }, completion: { _ in self.cancelButton.isHidden = false })
    }
    
    @objc func backButtonAction() {
        settingUpConstraintsForLargeImage()
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
            self.userImage.layer.borderWidth = 3
            self.userImage.layer.cornerRadius = 50
            self.cancelButton.isHidden = true
        }, completion: nil)
    }
    
    func settingUpConstraintsForSmallImage() {
        ConstraintsForAvatarAndItsBackground.topSmallImage?.isActive = false
        ConstraintsForAvatarAndItsBackground.leadingSmallImage?.isActive = false
        ConstraintsForAvatarAndItsBackground.widthSmallImage?.isActive = false
        ConstraintsForAvatarAndItsBackground.heightSmallImage?.isActive = false
        
        ConstraintsForAvatarAndItsBackground.centerXBigImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.centerYBigImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.widthBigImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.heightBigImage?.isActive = true
        
        ConstraintsForAvatarAndItsBackground.centerXSmallBackgroundView?.isActive = false
        ConstraintsForAvatarAndItsBackground.centerYSmallBackgroundView?.isActive = false
        ConstraintsForAvatarAndItsBackground.widthSmallBackgroundView?.isActive = false
        ConstraintsForAvatarAndItsBackground.heightSmallBackgroundView?.isActive = false
        
        ConstraintsForAvatarAndItsBackground.centerXBigBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.centerYBigBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.widthBigBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.heightBigBackgroundView?.isActive = true
    }
    
    func settingUpConstraintsForLargeImage() {
        ConstraintsForAvatarAndItsBackground.centerXBigImage?.isActive = false
        ConstraintsForAvatarAndItsBackground.centerYBigImage?.isActive = false
        ConstraintsForAvatarAndItsBackground.widthBigImage?.isActive = false
        ConstraintsForAvatarAndItsBackground.heightBigImage?.isActive = false
        
        ConstraintsForAvatarAndItsBackground.topSmallImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.leadingSmallImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.widthSmallImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.heightSmallImage?.isActive = true
        
        ConstraintsForAvatarAndItsBackground.centerXBigBackgroundView?.isActive = false
        ConstraintsForAvatarAndItsBackground.centerYBigBackgroundView?.isActive = false
        ConstraintsForAvatarAndItsBackground.widthBigBackgroundView?.isActive = false
        ConstraintsForAvatarAndItsBackground.heightBigBackgroundView?.isActive = false
        
        ConstraintsForAvatarAndItsBackground.centerXSmallBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.centerYSmallBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.widthSmallBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.heightSmallBackgroundView?.isActive = true
    }
    
    func activateContraints() {
        
        // Avatar close button
        cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0).isActive = true
        cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0).isActive = true
        
        
        // Avatar
        ConstraintsForAvatarAndItsBackground.topSmallImage = userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0)
        ConstraintsForAvatarAndItsBackground.leadingSmallImage = userImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ConstraintsForAvatarAndItsBackground.widthSmallImage = userImage.widthAnchor.constraint(equalToConstant: 100)
        ConstraintsForAvatarAndItsBackground.heightSmallImage = userImage.heightAnchor.constraint(equalToConstant: 100)
        
        ConstraintsForAvatarAndItsBackground.centerXBigImage = userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ConstraintsForAvatarAndItsBackground.centerYBigImage = userImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ConstraintsForAvatarAndItsBackground.widthBigImage = userImage.widthAnchor.constraint(equalToConstant: view.frame.width)
        ConstraintsForAvatarAndItsBackground.heightBigImage = userImage.heightAnchor.constraint(equalToConstant: view.frame.width)
        
        ConstraintsForAvatarAndItsBackground.topSmallImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.leadingSmallImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.widthSmallImage?.isActive = true
        ConstraintsForAvatarAndItsBackground.heightSmallImage?.isActive = true
        
        
        // Background avatar
        ConstraintsForAvatarAndItsBackground.centerXSmallBackgroundView = viewBackground.centerXAnchor.constraint(equalTo: userImage.centerXAnchor)
        ConstraintsForAvatarAndItsBackground.centerYSmallBackgroundView = viewBackground.centerYAnchor.constraint(equalTo: userImage.centerYAnchor)
        ConstraintsForAvatarAndItsBackground.widthSmallBackgroundView = viewBackground.widthAnchor.constraint(equalToConstant: 0)
        ConstraintsForAvatarAndItsBackground.heightSmallBackgroundView = viewBackground.heightAnchor.constraint(equalToConstant: 0)
        
        ConstraintsForAvatarAndItsBackground.centerXBigBackgroundView = viewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ConstraintsForAvatarAndItsBackground.centerYBigBackgroundView = viewBackground.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ConstraintsForAvatarAndItsBackground.widthBigBackgroundView = viewBackground.widthAnchor.constraint(equalToConstant: view.frame.width)
        ConstraintsForAvatarAndItsBackground.heightBigBackgroundView = viewBackground.heightAnchor.constraint(equalToConstant: view.frame.height)
        
        ConstraintsForAvatarAndItsBackground.centerXSmallBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.centerYSmallBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.widthSmallBackgroundView?.isActive = true
        ConstraintsForAvatarAndItsBackground.heightSmallBackgroundView?.isActive = true
    }
}
