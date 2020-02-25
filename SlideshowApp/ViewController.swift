//
//  ViewController.swift
//  SlideshowApp
//
//  Created by takumu on 2020/02/24.
//  Copyright © 2020 Takumu Yahagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var image1 = UIImage(named: "A1")!
    var image2 = UIImage(named: "A2")!
    var image3 = UIImage(named: "A3")!
    
    var timer:Timer!
    var image_count = 1

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var susumu: UIButton!
    @IBOutlet weak var modoru: UIButton!
    @IBOutlet weak var dousa: UIButton!
    
    @IBAction func buttonAction(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageButton.setImage(image1, for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.timer != nil{
            self.timer.invalidate()
            self.timer = nil
            dousa.setTitle("再生", for: .normal)
        }
        let nextViewController:NextViewController = segue.destination as! NextViewController
        if image_count == 1{
            nextViewController.image = image1
        }else if image_count == 2{
            nextViewController.image = image2
        }else{
            nextViewController.image = image3
        }
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
   
    }

    @IBAction func susumu(_ sender: Any) {
        if self.timer == nil{
            count(true)
        }
    }
    @IBAction func modoru(_ sender: Any) {
        if self.timer == nil{
            count(false)
        }
    }
    @IBAction func dousa(_ sender: Any) {
        
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(update(_:)), userInfo: nil, repeats: true)
            susumu.isEnabled = false
            modoru.isEnabled = false
            dousa.setTitle("停止", for: .normal)
        }else{
            self.timer.invalidate()
            self.timer = nil
            susumu.isEnabled = true
            modoru.isEnabled = true
            dousa.setTitle("再生", for: .normal)
        }
    }
    
    @objc func update(_ timer: Timer){
       count(true)
    }
    
    func count(_ flag:Bool){
        if flag{
            if image_count == 1{
                imageButton.setImage(image2, for: .normal)
                image_count = 2
            }else if image_count == 2{
                imageButton.setImage(image3, for: .normal)
                image_count = 3
            }else if image_count == 3{
                imageButton.setImage(image1, for: .normal)
                image_count = 1
            }
        }else{
            if image_count == 1{
               imageButton.setImage(image3, for: .normal)
               image_count = 3
           }else if image_count == 2{
               imageButton.setImage(image1, for: .normal)
               image_count = 1
           }else if image_count == 3{
               imageButton.setImage(image2, for: .normal)
               image_count = 2
           }
        }
        
    }
}

