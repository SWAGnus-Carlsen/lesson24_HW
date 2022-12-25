//
//  DetailUserVC.swift
//  RestAPIAppCW
//
//  Created by Martynov Evgeny on 22.12.22.
//

import UIKit

class DetailUserVC: UIViewController {
    
    var user: User?
    
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var username: UILabel!
    @IBOutlet private weak var email: UILabel!
    @IBOutlet private weak var phone: UILabel!
    @IBOutlet private weak var website: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func postsAction() {
        let storyboard = UIStoryboard(name: "PostFlow", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PostsTVC") as! PostsTVC
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func albomsAction() {
//        let storyboard = UIStoryboard(name: "AlbumsAndPhotos", bundle: nil)
//        guard let vc = storyboard.instantiateViewController(withIdentifier: "AlbumsTVC") as? AlbumsTVC else { return }
//        vc.user = user
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func todosAction() {
    }
    
    private func setupUI() {
        name.text = user?.name
        username.text = user?.username
        email.text = user?.email
        phone.text = user?.phone
        website.text = user?.website
    }
}
