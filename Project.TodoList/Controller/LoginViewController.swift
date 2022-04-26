//
//  LoginViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 26/4/2565 BE.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    // 627157754249-gu0kin3dcn4e2t3vjsu5gesdeq430702.apps.googleusercontent.com
    let signInConfig = GIDConfiguration.init(clientID: "627157754249-gu0kin3dcn4e2t3vjsu5gesdeq430702.apps.googleusercontent.com")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    @IBAction func btnLoginGoogle(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            self.presentViewController()
        }
    }
    
    func presentViewController() {
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: TodolistViewController.identifier) as? TodolistViewController
        viewController?.modalPresentationStyle = .fullScreen
        self.navigationController?.present(viewController!, animated: true)
    }
    
}
