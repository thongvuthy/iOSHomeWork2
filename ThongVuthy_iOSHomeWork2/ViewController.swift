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
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    var codeCountryLabel : UILabel!
    var textFields:[UITextField]!
    
    @IBAction func signUpButtonClick(_ sender: Any) {
        performSegue(withIdentifier: "sequez", sender: self)
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        textFields = [usename, password, phonenumber , email]
        setUpTextFields()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC : AnotherViewController = segue.destination as! AnotherViewController
        destVC.data = usename.text!
    }
    
    @IBAction func unwindSeque (_ sender : UIStoryboardSegue) {
        
        usename.text = ""; phonenumber.text = "" ; email.text = ""; password.text = ""
        usename.placeholder = "Username"
        phonenumber.placeholder = "(+855) 015-999-999-7"
        email.placeholder = "example@gmail.com"
        password.placeholder = "Password"
        phonenumber.leftView = nil
        phonenumber.leftViewMode = UITextFieldViewMode.always
   
       
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if phonenumber === textField {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return true }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 12
        }
        return true
    }
    
    
    func setUpTextFields() {
        password.isSecureTextEntry = true
        phonenumber.addTarget(self, action: #selector(textFieldValueDidChange), for: UIControlEvents.editingChanged)
        
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
        phonenumber.placeholder = "015-599-999-7"
    }

    
    @objc func textFieldValueDidChange(){
        var temp = phonenumber.text!
        for _ in temp {
            if let i = temp.characters.index(of: "-") {
                temp.remove(at: i)
            }
        }
        phonenumber.text = self.formatPhoneNumber(charArray: temp)

    }
    
    
    func formatPhoneNumber (charArray: String) -> String {
        let original : [Character] = Array (charArray)
        var chars : [Character] = Array (charArray)
        var finishedValues = ""
                repeat {
                    if(chars.count >= 3) {
                        var newChar = chars[...2]
                        for _ in 0...2 {
                            chars.remove(at: 0)
                        }
                        if chars.count > 3 {
                            newChar += "-"
                        }
                        finishedValues += newChar
                    }else if (chars.count == 2){
                        finishedValues += chars[..<2]
                    }else if (chars.count == 1) {
                        finishedValues += chars[..<1]
                    }
                    
                } while chars.count > 3
        
        
        if !chars.isEmpty  {
            if(original.count > 3) {
                finishedValues += "-"
                finishedValues += chars
            }
        }
        
        return finishedValues
    }
    
    

    
}


