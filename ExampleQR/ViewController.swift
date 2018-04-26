//
//  ViewController.swift
//  ExampleQR
//
//  Created by Eduardo Barrón on 26/04/18.
//  Copyright © 2018 Eduardo Barrón. All rights reserved.
//

import UIKit

class ViewController: ViewControllerQR {
    
    @IBOutlet weak var txtTexto: UITextField!
    @IBOutlet weak var imgQR: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgQR.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionGeneraQR(_ sender: Any) {
        imgQR.image = nil
        let texto = txtTexto.text!
        if texto.count > 0{
            if let imageToSave = texto.toQRCode(size : CGSize(width: 250, height: 250)){
                if saveImageToDocumentsDirectory(image: imageToSave, withName: "imageName.png") != nil{
                    imgQR.image = imageToSave
                    print("NOT Failed to save image")
                }else{
                    print("Failed to save image")
                }
            }
        }else{
            print("Necesita tener texto para generar QR")
        }
    }
    
    @IBAction func actionShareImage(_ sender: Any) {
        if let image = loadImageFromDocumentsDirectory(imageName: "imageName.png"){
            let shareAll = [image] as [Any]
            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }else{
            print ("Failed to load image")
        }
    }
    
}

