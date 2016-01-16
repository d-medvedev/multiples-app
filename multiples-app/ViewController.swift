//
//  ViewController.swift
//  multiples-app
//
//  Created by Dmitry Medvedev on 16/01/16.
//  Copyright © 2016 Dmitry Medvedev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var multiplesLogo: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var addLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var multiple = 0
    var prevSum = 0
    var currentSum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
    }
    
    @IBAction func onPlayButtonClick (sender: UIButton!){
        
        if textField.text != nil && textField.text != "" {
            
            multiplesLogo.hidden = true
            textField.hidden = true
            playButton.hidden = true
            
            addButton.hidden = false
            addLabel.hidden = false
            multiple = Int(textField.text!)!
        }
    }
    
    @IBAction func onAddButtonClick (sender: UIButton!){
        
        currentSum = prevSum + multiple
        addLabel.text = "\(prevSum) + \(multiple) = \(currentSum)"
        prevSum = currentSum
        
        if currentSum >= 30 {
            textField.text = ""
            addLabel.text = "Press Add to add!"
            
            multiplesLogo.hidden = false
            textField.hidden = false
            playButton.hidden = false
            
            addButton.hidden = true
            addLabel.hidden = true
            
            multiple = 0
            prevSum = 0
            currentSum = 0
        }
    }
    
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
    }


}

