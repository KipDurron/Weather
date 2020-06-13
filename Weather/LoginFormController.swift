//
//  LoginFormControllerViewController.swift
//  Weather
//
//  Created by Илья Кадыров on 12.06.2020.
//  Copyright © 2020 Илья Ишунин. All rights reserved.
//

import UIKit

class LoginFormController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    

    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    //    @IBAction func scrollTapped(_ sender: Any) {
//        hideKeyboard()
//    }
    
    @IBAction func loginButtonPresed(_ sender: Any) {

        if let login = loginInput.text, let password = passwordInput.text{
            // Проверяем, верны ли они
            print(login)
            print(password)
            if login == "admin" && password == "admin" {
                print("успешная авторизация")
            } else {
                print("неуспешная авторизация")
            }
        }
    }

    @objc func keyboardWillShow(notification: Notification) {
         guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
         
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
     }
     
     @objc func keyboardWillHide(notification: Notification) {
        self.scrollView.contentInset = .zero
     }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
         //Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        self.scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
