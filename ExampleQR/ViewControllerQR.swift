//
//  ViewControllerQR.swift
//  ExampleQR
//
//  Created by Eduardo Barrón on 26/04/18.
//  Copyright © 2018 Eduardo Barrón. All rights reserved.
//

import UIKit

public class ViewControllerQR: UIViewController {
    
    func getDocumentDirectoryPath() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    
    func saveImageToDocumentsDirectory(image: UIImage, withName: String) -> String? {
        if let data = UIImagePNGRepresentation(image) {
            let dirPath = getDocumentDirectoryPath()
            let imageFileUrl = URL(fileURLWithPath: dirPath.appendingPathComponent(withName) as String)
            do {
                try data.write(to: imageFileUrl)
                print("Successfully saved image at path: \(imageFileUrl)")
                return imageFileUrl.absoluteString
            } catch {
                print("Error saving image: \(error)")
            }
        }
        return nil
    }
    
    func loadImageFromDocumentsDirectory(imageName: String) -> UIImage? {
        let tempDirPath = getDocumentDirectoryPath()
        let imageFilePath = tempDirPath.appendingPathComponent(imageName)
        return UIImage(contentsOfFile:imageFilePath)
    }

}
