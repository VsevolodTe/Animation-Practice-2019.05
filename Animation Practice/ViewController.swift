//
//  ViewController.swift
//  Animation Practice
//
//  Created by Denis Bystruev on 20/05/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let initialFrame = CGRect(x: 0, y: 0, width: 100, height: 100)

    var square: UIView!
    
    var numberOfTouches = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        square = UIView(frame: initialFrame)
        
        square.backgroundColor = .purple
        
        view.addSubview(square)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let width = view.frame.width
        let height = view.frame.height
        
        numberOfTouches += 1
        
        switch numberOfTouches {
            
        case 1:
            let scaleTransform = CGAffineTransform(scaleX: 2, y: 2)
            let rotateTransform = CGAffineTransform(rotationAngle: .pi)
            let translateTransform = CGAffineTransform(translationX: 200, y: 200)
            let comboTransform = scaleTransform.concatenating(
                rotateTransform.concatenating(
                    translateTransform
                )
            )
            UIView.animate(withDuration: 2, animations: {
                self.square.transform = comboTransform
            }) { _ in
                UIView.animate(withDuration: 2, animations: {
                    self.square.transform = CGAffineTransform.identity
                })
            }
            
        case 2:
            UIView.animate(withDuration: 3, animations: {
                self.square.backgroundColor = .orange
                self.square.frame = CGRect(x: width / 4, y: height / 4, width: 200, height: 200)
            }) { _ in
                
                UIView.animate(withDuration: 3) {
                    self.square.backgroundColor = .purple
                    self.square.frame = self.initialFrame
                }
            }
            
        case 3:
            UIView.animate(withDuration: 3, delay: 2, options: [.autoreverse], animations: {
                self.square.backgroundColor = .orange
                self.square.frame = CGRect(x: width / 2, y: height / 2, width: 100, height: 100)
            }, completion: nil)
            
        default:
            numberOfTouches = 0
        }

    }
}

