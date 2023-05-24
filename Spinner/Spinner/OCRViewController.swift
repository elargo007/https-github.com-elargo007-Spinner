//
//  OCRViewController.swift
//  Spinner
//
//  Created by Steven Petteruti on 5/22/23.
//

import UIKit

class OCRViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var OCRscan: UIButton!
     
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }
}

// Press OCRscan button
@IBAction func didTapGreen() {
    guard let vc = storyboard?.instantiateViewController(identifier: "green_vc") as? GreenViewController else {
        return
    }
    present(vc, animated: true)
}
