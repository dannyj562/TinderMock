//
//  CardsViewController.swift
//  TinderMock
//
//  Created by Danny on 10/29/18.
//  Copyright © 2018 Danny Rivera. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var navBarImageView: UIImageView!
    @IBOutlet weak var actionImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = profileImageView.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "onTapSegue", sender: self)
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
    
        if sender.state == .began {
            NSLog("Gesture began")
        } else if sender.state == .changed {
            NSLog("Gesture changed")
            if translation.y < 0 {
                NSLog("User swiped up")
                UIView.animate(withDuration: 0.5, animations: {
                    self.profileImageView.center = CGPoint(x: self.cardInitialCenter.x, y: self.cardInitialCenter.y - 500)
                })
            } else if translation.x > 0 {
                NSLog("User swiped right")
                profileImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * (Double.pi/180)))
            } else if translation.x < 0 {
                NSLog("User swiped left")
                profileImageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * (Double.pi/180)))
            }
        } else if sender.state == .ended {
            NSLog("Gesture ended")
            if translation.x > 50 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.profileImageView.center = CGPoint(x: self.cardInitialCenter.x + 500, y: 0)
                })
            } else if translation.x < -50 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.profileImageView.center = CGPoint(x: self.cardInitialCenter.x - 500, y: 0)
                })
            }
            profileImageView.center = cardInitialCenter
            profileImageView.transform = CGAffineTransform.identity
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profileViewController = segue.destination as! ProfileViewController
        profileViewController.profileImage = profileImageView.image
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
