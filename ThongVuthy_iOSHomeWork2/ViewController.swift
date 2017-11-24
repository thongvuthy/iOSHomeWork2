//
//  ViewController.swift
//  ThongVuthy_iOSHomeWork2
//
//  Created by Adimax Lee on 24/11/17.
//  Copyright © 2017 Adimax Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usename: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    var codeCountryLabel : UILabel!
    var textFields:[UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [usename, password, phonenumber , email]
        setUpTextFields()
       
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        for(index, currentTextField) in textFields.enumerated() {
            if currentTextField === textField {
                if index < 3 {
                    textFields[index + 1].becomeFirstResponder()
                } else { currentTextField.resignFirstResponder()}
            }
        }
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if phonenumber === textField  {
           setLeftViewCountryCode()
        }
    }
    
    
    
    func setUpTextFields() {
        for (index, textField) in textFields.enumerated() {
            textField.borderStyle = UITextBorderStyle.roundedRect
            textField.delegate = self
            if index != 3{
                if index == 2 { textField.keyboardType = UIKeyboardType.numberPad }
                textField.returnKeyType = UIReturnKeyType.next
            } else {
                textField.keyboardType = UIKeyboardType.emailAddress
                textField.returnKeyType = UIReturnKeyType.done
            }
        }
    }
    
    
    func setLeftViewCountryCode(){
        codeCountryLabel = UILabel(frame: CGRect(x:0, y:0, width: 55, height: self.phonenumber.frame.height))
        codeCountryLabel.text = " (+855)"
        codeCountryLabel.textColor = .black
        codeCountryLabel.font = codeCountryLabel.font.withSize(16)
        phonenumber.leftView = codeCountryLabel
        phonenumber.leftViewMode = UITextFieldViewMode.always
        phonenumber.placeholder = "015-599-997"
    }
}

