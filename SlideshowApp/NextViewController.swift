//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by takumu on 2020/02/24.
//  Copyright © 2020 Takumu Yahagi. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imageBig: UIImageView!
    var image:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageBig.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
