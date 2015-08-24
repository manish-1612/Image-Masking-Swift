//
//  ViewController.swift
//  ImageMaskingSwift
//
//  Created by Manish Kumar on 24/08/15.
//  Copyright (c) 2015 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var image = UIImage(named: "image.png")
        var maskingImage = UIImage(named: "mask23.png")
        imageView.image = maskImage(image!, mask: maskingImage!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func maskImage(image:UIImage, mask:(UIImage))->UIImage{
        
        var imageReference = image.CGImage
        var maskReference = mask.CGImage
        
        var imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference), CGImageGetHeight(maskReference), CGImageGetBitsPerComponent(maskReference), CGImageGetBitsPerPixel(maskReference), CGImageGetBytesPerRow(maskReference), CGImageGetDataProvider(maskReference), nil, true)
        
        var maskedReference = CGImageCreateWithMask(imageReference, imageMask)
        
        var maskedImage = UIImage(CGImage: maskedReference)
        
        return maskedImage!

    }
    
}

