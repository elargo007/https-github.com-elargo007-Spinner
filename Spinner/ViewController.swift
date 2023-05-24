//
//  ViewController.swift
//  RotateImage
//
//  Created by Steven Petteruti on 3/28/23.
//  Revised 5/18/23, 5/21/23, 5/24/23

import UIKit
var degrees_23: Double = 8 // to rotate 22.5º divide 2𝝅 radians by 8
var degrees_45: Double = 4 // to rotate 45º divide 2𝝅 radians by 4
var degrees_360: Double = 1 // to rotate 45º divide 2𝝅 radians by 1
// var imageView = UIImageView()
var duration: Double = 5 // duration for rotating logo
var image = UIImage(named: "person.and.background.dotted")

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var logoView: UIImageView!
    @IBOutlet var Buttons: [UIButton]!
    @IBOutlet var CramlyLabel: UILabel!
    @IBOutlet var CramlyR: UILabel!
    
    // Add suplicate Launchscreen imageView
    private let launchImageView: UIImageView = {
        let launchImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        launchImageView.image = UIImage(named: "Cramly Logo only")
        return launchImageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(launchImageView) // Add duplicate LaunchScreen
        guard let customFont = UIFont(name: "Ananda Black", size: UIFont.labelFontSize) else {
            fatalError("""
                Failed to load the "Ananda Black" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        //CramlyLabel.font = UIFontMetrics(forTextStyle: .headline).scaledFont(for: customFont)
        CramlyLabel.adjustsFontForContentSizeCategory = false
        // Add an array of buttons after loading the view
        for button in Buttons {
            button.layer.cornerRadius = 0
        }
        // Delay spinLogo by 1 second
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
           self.spinLogo2() // Spin logo without button pressed
        })
    }
    
    // Add duplicate LaunchScreen function
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        launchImageView.center = view.center
        // Delay animation
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            //self.animate()
            //self.spinLogo2() // Spin logo without button pressed
        })
      
    }
    
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width / 2
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffx/2),
                y: diffy/2,
                width: size,
                height: size
            )
        })
    }
    
    @IBAction func ocrViewButton() {
        guard let vc = storyboard?.instantiateViewController(identifier: "OCR") as? OCRViewController else {
            print("failed to get vc from storyboard")
            return
        }
        present(vc, animated: true)
    }
    
    @IBAction func rotate45º(_sender: Any) {
        imageView.transform = imageView.transform.rotated(by: CGFloat(Double.pi / degrees_45))
    }

    // SPIN BUTTON - duration helps to control rotation speed
    @IBAction func spinButton(targetView: UIView, duration: Double = 5) {
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi / degrees_23))
        }) { finished in
            self.spinButton(targetView: targetView, duration: duration)
        }
    }
    
    // SPIN LOGO - duration helps to control rotation speed
    @IBAction func spinLogo(sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(Double.pi))
        }) { (finished) -> Void in
            self.spinLogo(sender: sender)
        }
    }
    
    // SPIN LOGO - duration helps to control rotation speed
    private func spinLogo2() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.logoView.transform = self.logoView.transform.rotated(by: CGFloat(Double.pi)
            )
        }){ (finished) -> Void in
            self.spinLogo2()
        }
    }
}
