//
//  ViewController.swift
//  Spinner
//
//  Created by Steven Petteruti on 3/29/23.
//  Revised 5/18/23

import UIKit
var degrees_23: Double = 8 // to rotate 22.5º divide 2𝝅 radians by 8
var degrees_45: Double = 4 // to rotate 45º divide 2𝝅 radians by 4

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var rotateLogo: UIButton!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet var CramlyFont: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        CramlyFont.text = "Code Cramly Label"
        CramlyFont.font = UIFont(name: "Ananda", size: 23 ) // Set custom font
        // Add an array of buttons after loading the view
        for button in Buttons {
            button.layer.cornerRadius = 0
        }
    }
    
    @IBAction func rotate23º(_ sender: Any) {
       imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi / degrees_23))
    }
    
        @IBAction func rotate45º(_ sender: Any) {
           imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi / degrees_45))
        }
   
    // SPIN BUTTON duration helps to control rotation speed
    @IBAction func rotateView(targetView: UIView, duration: Double = 5) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi / degrees_23))
        }) { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }
    
    // ROTATE LOGO - duration helps to control rotation speed
    @IBAction func rotateLogo(imageView: UIView, duration: Double = 5) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            imageView.transform = imageView.transform.rotated(by: .pi)
        }) { finished in
            self.rotateLogo(imageView: imageView, duration: duration)
        }
    }
       
    @IBAction func buttonClicked(_ sender: UIButton) {
        // Loop 5 times and print the index value each time
        for i in 1...5 {
            sleep(1) // delay by pause
            imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi / degrees_23)) // rotate 22.5º
            print("Loop iteration \(i) after sleep ") // for debug
        }
    }

}

