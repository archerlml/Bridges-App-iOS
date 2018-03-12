//
//  ViewController.swift
//  Bible Study Helper
//
//  Created by Minglu LIU on 4/11/17.
//  Copyright © 2017 Bridges International. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var page:Int = 1
    var index:Int = 1
    var selection:Int = 1
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var titles: UIImageView!
    @IBOutlet weak var contents: UIImageView!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var back: UILabel!
    @IBOutlet weak var bible: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images.alpha = 0.85
        titles.alpha = 0.75
        contents.alpha = 0.75
        text.isHidden = true
        back.isHidden = true
        text.isEditable = false
        bible.isHidden = false
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap(_:)))
    
        contents.addGestureRecognizer(longGesture)
        
        let backTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backTapped(tapGestureRecognizer:)))
        back.isUserInteractionEnabled = true
        back.addGestureRecognizer(backTapGestureRecognizer)
        
        let bibleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(bibleTapped(tapGestureRecognizer:)))
        bible.isUserInteractionEnabled = true
        bible.addGestureRecognizer(bibleTapGestureRecognizer)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        titles.isUserInteractionEnabled = true
        titles.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped2(tapGestureRecognizer:)))
        contents.isUserInteractionEnabled = true
        contents.addGestureRecognizer(tapGestureRecognizer2)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
    self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
    }
    
    func longTap(_ sender: UIGestureRecognizer){
        let s = try! String(contentsOfFile: Bundle.main.path(forResource: "S" + String(index) + "E" + String(selection), ofType: "txt")!)
        print("Long tap")
        if sender.state == .ended {
            print("UIGestureRecognizerState Ended")
            //Do Whatever You want on End of Gesture
        }
        else if sender.state == .began {
            print("UIGestureRecognizerState Began.")
            text.text = s;
            text.isHidden = false;
            titles.isHidden = true;
            contents.isHidden = true;
            logo.isHidden = true;
            back.isHidden = false;
        }
    }
    
    func bibleTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        print("bible tapped")
        let s = try! String(contentsOfFile: Bundle.main.path(forResource: "S" + String(index) + "E" + String(selection), ofType: "txt")!)
        text.text = s;

        text.isHidden = false;
        titles.isHidden = true;
        contents.isHidden = true;
        logo.isHidden = true;
        back.isHidden = false;
        bible.isHidden = true;
    }
    
    func backTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        print("back tapped")
        text.isHidden = true;
        titles.isHidden = false;
        contents.isHidden = false;
        logo.isHidden = false;
        back.isHidden = true;
        bible.isHidden = false;
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
        if index > 7{
            index = 1;
        }else{
            index = index + 1;
        }
        selection = 1;
        print("title tapped")
        print(index)
        displayTitle(titleNumber: index)
        
    }
    
    func imageTapped2(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
        if selection > 4{
            selection = 1;
        }else{
            selection = selection + 1;
        }
        print("content tapped")
        print(selection)
        displayContent(contentNumber: selection)
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                if page > 1{
                    page = page - 1
                }
                print("Page Swiped right")
                print(page)
                displayImage(pageNumber: page)
            case UISwipeGestureRecognizerDirection.down:
                if page > 1{
                    page = page - 1
                }
                print("Page Swiped down")
                print(page)
                displayImage(pageNumber: page)
            case UISwipeGestureRecognizerDirection.left:
                if page < 4{
                    page = page + 1
                }
                print("Page Swiped left")
                print(page)
                displayImage(pageNumber: page)
            case UISwipeGestureRecognizerDirection.up:
                if page < 4{
                    page = page + 1
                }
                print("Page Swiped up")
                print(page)
                displayImage(pageNumber: page)
            default:
                break
            }
        }
    }

    
    
    func displayImage(pageNumber:Int){
        
        if pageNumber == 1{
            images.image = UIImage(named: "pods-i.jpg")
        }else if pageNumber == 2{
            images.image = UIImage(named: "pods-ii.jpg")
        }else if pageNumber == 3{
            images.image = UIImage(named: "pods-iii.jpg")
        }else if pageNumber == 4{
            images.image = UIImage(named: "pods-iiii.jpg")
        }else{
            images.image = UIImage(named: "pods-i.jpg")
        }
    }
    func displayTitle(titleNumber:Int){
        titles.image = UIImage(named: String(titleNumber) + ".png")
        contents.image = UIImage(named: String(titleNumber) + "-1.png")
    }
    
    func displayContent(contentNumber:Int){
            contents.image = UIImage(named: String(index) + "-" + String(contentNumber) + ".png")
    }
    
    
}

