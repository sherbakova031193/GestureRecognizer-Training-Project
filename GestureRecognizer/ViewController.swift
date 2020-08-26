//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Елизавета Щербакова on 26.02.2020.
//  Copyright © 2020 Sсherbakova Elizaveta Nikolaevna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipesObservers()
        
        tapObserver()
    }

    func swipesObservers() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func tapObserver() {
        
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
        
    }
    
    @objc func handleSwipes(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case.right:
            label.text = "Свайп вправо"
        case.left:
            label.text = "Свайп влево"
        case.up:
            label.text = "Свайп вверх"
        case.down:
             label.text = "Свайп вниз"
        default:
            break
        }
    }
    
    @objc func tripleTapAction(gesture: UITapGestureRecognizer) {
        
        label.text = "Тройной тап"
    }
    
    @objc func doubleTapAction(gesture: UITapGestureRecognizer) {
        
        label.text = "Двойной тап"
    }

}

