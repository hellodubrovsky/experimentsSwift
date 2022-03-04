//
//  ViewController.swift
//  Gestures&Amimation
//
//  Created by Илья on 31.01.2022.
//

import UIKit

class ViewController: UIViewController {

    let animationView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.backgroundColor = .red
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        let recognizerBacic = UITapGestureRecognizer()
        recognizerBacic.addTarget(self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(recognizerBacic)
        
        
        //animate()
        //animatePropertyAnimator()
        animateLayer()
        activatingConstraints()
    }
    
    // MARK: 1. UIView.animate
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //let startPoint = animationView.center
        //UIView.animate(withDuration: 3.0, delay: 2.0, options: .curveEaseInOut, animations: { self.animationView.center = CGPoint(x: startPoint.x, y: startPoint.y + 100.0) }, completion: nil)
    }
    
    // MARK: 2. AnimateKeyFrame
    func animate() {
        let startPoint = animationView.center
        UIView.animateKeyframes(withDuration: 5.0,
                                delay: 0.0,
                                options: .calculationModeCubic,
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.00, relativeDuration: 0.25, animations: { self.animationView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0) })
                                    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: { self.animationView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY) })
                                    UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: { self.animationView.center = CGPoint(x: self.view.bounds.width, y: startPoint.y) })
                                    UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: { self.animationView.center = startPoint }) },
                                completion: { _ in self.animationView.transform = CGAffineTransform.identity })
    }
    
    // MARK: 3. AnimatorProperty
    func animatePropertyAnimator() {
        let startPoint = animationView.center
        let animator = UIViewPropertyAnimator(duration: 5.0, curve: .linear) {
            self.animationView.center = CGPoint(x: startPoint.x, y: startPoint.y + 100.0)
        }
        animator.startAnimation()
    }
    
    // MARK: 4. Amimate layer. CABasicAnimation
    func animateLayer() {
        let startPoint = animationView.center
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            print("did finish")
        })
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.toValue = CGPoint(x: startPoint.x, y: startPoint.y + 500)
        animation.duration = 5.0
        animation.autoreverses = false
        animation.isRemovedOnCompletion = true
        animationView.layer.add(animation, forKey: #keyPath(CALayer.position))
        
        CATransaction.commit()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func activatingConstraints() {
        NSLayoutConstraint.activate([
            animationView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100.0),
            animationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            animationView.widthAnchor.constraint(equalToConstant: 100.0),
            animationView.heightAnchor.constraint(equalToConstant: 150.0),
        ])
    }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        print("Did catch action. \n-> \(gesture)\n")
    }
}
