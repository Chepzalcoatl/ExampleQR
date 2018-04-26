//
//  Extensions.swift
//  ExampleQR
//
//  Created by Eduardo Barrón on 26/04/18.
//  Copyright © 2018 Eduardo Barrón. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    func toQRCode(size : CGSize) -> UIImage? {
        let data = self.data(using: .utf8)
        if let filter = CIFilter(name: "CIQRCodeGenerator", withInputParameters: ["inputMessage" : data!, "inputCorrectionLevel":"L"]) {
            let transform = CGAffineTransform(scaleX: 7.0, y: 5.0)
            if let ciImage = filter.outputImage?.transformed(by: transform){
                //let size = CGSize(width: 250, height: 250)
                UIGraphicsBeginImageContextWithOptions(size, false, 1)
                defer { UIGraphicsEndImageContext() }
                UIImage(ciImage: ciImage).draw(in: CGRect(origin: .zero, size: size))
                guard let redraw = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
                return redraw
            }
            return nil
        }
        return nil
    }
}
