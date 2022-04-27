//
//  ViewController.swift
//  CoreAnimation
//
//  Created by Developer on 27/04/22.
//

import UIKit
import TheAnimation

class ViewController: UIViewController {

    let layer = CALayer() //global
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        layer.backgroundColor = UIColor.systemRed.cgColor
        layer.frame = CGRect(x: 100, y: 100, width: 120, height: 120)
        view.layer.addSublayer(layer)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            //self.animateOpacity()
           // self.animateMovement()
            self.routate()
        }
    }
    
    func routate(){
        let animation = BasicAnimation(keyPath: .transformRotationZ)
        animation.fromValue = 0
        animation.toValue = .pi * 12
        animation.duration = 1 //animation faster
        animation.timingFunction = .linear
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
    
    func animateMovement(){
        let animation = BasicAnimation(keyPath: .position)
        animation.fromValue = CGPoint(x: layer.frame.origin.x + ( layer.frame.size.width/2 ), y: layer.frame.origin.y + ( layer.frame.size.height/2)) //from the center
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 1 //animation faster
        animation.timingFunction = .easeInEaseOut
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }

    func animateOpacity(){
        let animation = BasicAnimation(keyPath: .opacity)
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3 //animation faster
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        animation.animate(in: layer)
    }
}

