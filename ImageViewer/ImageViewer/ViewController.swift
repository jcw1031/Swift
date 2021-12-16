//
//  ViewController.swift
//  ImageViewer
//
//  Created by 지찬우 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {
    var imgNum = 1
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image=UIImage(named: "1.jpeg")
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        if(imgNum==7){
            imgNum=1
        }
        else{
            imgNum+=1
        }
        let imgName=String(imgNum)+".jpeg"
        imgView.image=UIImage(named: imgName)
    }
    @IBAction func btnPrev(_ sender: UIButton) {
        if(imgNum==1){
            imgNum=7
        }
        else{
            imgNum-=1
        }
        let imgName=String(imgNum)+".jpeg"
        imgView.image=UIImage(named: imgName)
    }
    
}

