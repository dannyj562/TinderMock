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
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        if sender.state == .began {
            NSLog("Sender state began")
            cardInitialCenter = profileImageView.center
            NSLog("\(cardInitialCenter)")
        } else if sender.state == .changed {
            NSLog("Sender state changed")
            if velocity.x > 0 {
                NSLog("User swiped right")
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(-45 * (Double.pi/180)))
            } else {
                NSLog("User swiped left")
                profileImageView.transform = CGAffineTransform(rotationAngle: CGFloat(45 * (Double.pi/180)))
            }
        } else if sender.state == .ended {
            NSLog("Sender state ended")
            profileImageView.transform = CGAffineTransform.identity
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
