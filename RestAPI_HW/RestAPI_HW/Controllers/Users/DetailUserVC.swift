//
//  DetailUserVC.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 25.12.22.
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
        vc.title = "Posts"
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func coordinatesAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Coordinates", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MapVC") as? MapVC else { return }
        vc.title = "Google Map"
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func photosAction() {
        let storyboard = UIStoryboard(name: "AlbumsFlow", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AlbumsTVC") as? AlbumsTVC else { return }
        vc.title = "Albums"
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func todosAction() {
        let storyboard = UIStoryboard(name: "ToDosFlow", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ToDosTVC") as? ToDosTVC else { return }
        vc.title = "ToDo-s"
        vc.user = user
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        name.text = user?.name
        username.text = user?.username
        email.text = user?.email
        phone.text = user?.phone
        website.text = user?.website
    }
}
