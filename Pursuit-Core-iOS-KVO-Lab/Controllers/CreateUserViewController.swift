//
//  ViewController.swift
//  Pursuit-Core-iOS-KVO-Lab
//
//  Created by Jaheed Haynes on 4/8/20.
//  Copyright © 2020 Jaheed Haynes. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var balanceTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldDelegate()
    }
    
    
    private func textFieldDelegate(){
        usernameTextField.delegate = self
        balanceTextField.delegate = self
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        guard let userName = usernameTextField.text, !userName.isEmpty,
            let balance = balanceTextField.text, !balance.isEmpty else {
                showAlert(title: "Error", message: "Enter username and Balance amount")
                return
        }
        let user = UserAccount()
        
        user.userName = userName
        user.userBalance = Double(balance) ?? 0.0
        
        AllUsers.shared.allUsers.append(user)
        
        usernameTextField.text = ""
        balanceTextField.text = ""
    }
    
}

extension CreateUserViewController: UITextFieldDelegate{
    override func resignFirstResponder() -> Bool {
        usernameTextField.resignFirstResponder()
        balanceTextField.resignFirstResponder()
        return true
    }
}
