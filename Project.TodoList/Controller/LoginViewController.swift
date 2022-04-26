//
//  LoginViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 26/4/2565 BE.
//

import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {

    @IBOutlet weak var imgCenter: UIImageView!
    @IBOutlet weak var txTitleLogin: UILabel!
    @IBOutlet weak var txDetailTitleLogin: UILabel!
    
    @IBOutlet weak var viewButtonLogin: UIView!
    @IBOutlet weak var imgIconButtonLogin: UIImageView!
    @IBOutlet weak var txButtonLogin: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    // 627157754249-gu0kin3dcn4e2t3vjsu5gesdeq430702.apps.googleusercontent.com
    let signInConfig = GIDConfiguration.init(clientID: "627157754249-gu0kin3dcn4e2t3vjsu5gesdeq430702.apps.googleusercontent.com")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        prepareView()

    }
    
    func prepareView() {
        
        txTitleLogin.text = "Welcome"
        txTitleLogin.textAlignment = .center
        txDetailTitleLogin.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        txDetailTitleLogin.textAlignment = .center
        
        if let imageCenter = UIImage(named: "ic_vector_todo") {
            imgCenter.image = imageCenter
        }
        
        imgCenter.contentMode = .scaleAspectFit
        
        viewButtonLogin.backgroundColor = .lightGray
        viewButtonLogin.layer.cornerRadius = 20
        
        txButtonLogin.text = "Continue with Google"
        txButtonLogin.textAlignment = .center
        
        if let imageIcon = UIImage(named: "ic_google") {
            imgIconButtonLogin.image = imageIcon
        }
    }
    
    @IBAction func btnLoginGoogle(_ sender: Any) {
        
//        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
//            guard error == nil else { return }
//            self.presentViewController()
//        }
        
        GIDSignIn.sharedInstance.signIn( with: signInConfig, presenting: self ) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }
            
            self.presentViewController()
            // Your user is signed in!
        }
    }
    
    @IBAction func btnPushView(_ sender: Any) {

    }
    
    func presentViewController() {
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: TodolistViewController.identifier) as! TodolistViewController
//        let toDoViewController = TodolistViewController()
        viewController.modalPresentationStyle = .fullScreen
//        toDoViewController.modalPresentationStyle = .fullScreen
//        self.navigationController?.present(toDoViewController, animated: true)
        
        self.present(viewController, animated: true, completion: nil)
    }
    
}
