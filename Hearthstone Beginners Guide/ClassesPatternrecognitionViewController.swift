//
//  ClassesPatternrecognitionViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 24/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class ClassesPatternrecognitionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var takePhotoButton: UIButton!
    let imagePicker: UIImagePickerController! = UIImagePickerController();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self;
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if(userLogged.id == nil){
            self.takePhotoButton.enabled = false;
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePicture(sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .Camera
                imagePicker.cameraCaptureMode = .Photo
                presentViewController(imagePicker, animated: true, completion: {
                    print("Need something to show the camera");
                })
            } else {
                ViewUtil.alertMessage(self, title: "Rear camera doesn't exist", message: "Application cannot access the camera.") ;
            }
        } else {
            ViewUtil.alertMessage(self, title: "Camera inaccessable", message: "Application cannot access the camera.") ;
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage:UIImage = (info[UIImagePickerControllerOriginalImage]) as? UIImage {
            let selectorToCall = Selector("imageWasSavedSuccessfully:didFinishSavingWithError:context:")
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, selectorToCall, nil)            
        }
        imagePicker.dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user saves an image
            print("I could back");
        })
    }
    
    func imageWasSavedSuccessfully(image: UIImage, didFinishSavingWithError error: NSError!, context: UnsafeMutablePointer<()>) {
        
        if let theError = error{
            print("An error happened while saving the image = \(theError)");
        }else{
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("Image saved");
                self.currentImage.image = image;
                FBClient.shareMoment(self, image: self.currentImage.image!);
            })
        }
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("User canceled image")
        dismissViewControllerAnimated(true, completion: {
            // Anything you want to happen when the user selects cancel
        })
    }
    
    
    
    
    

}
