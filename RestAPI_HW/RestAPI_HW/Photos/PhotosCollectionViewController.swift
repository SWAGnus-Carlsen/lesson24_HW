//
//  PhotosCollectionViewController.swift
//  RestAPI_HW
//
//  Created by Vitaliy Halai on 15.01.23.
//

import UIKit
import SwiftyJSON


class PhotosCollectionViewController: UICollectionViewController {
    
    var user: User?
    var album: JSON?
    var photos: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView.register(UINib(nibName: "PhotoCVCell", bundle: .main), forCellWithReuseIdentifier: "PhotoCVCell")
        title = album?["title"].string
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let layout = UICollectionViewFlowLayout()
        let sizeWH = UIScreen.main.bounds.width / 2 - 5
        layout.itemSize = CGSize(width: sizeWH, height: sizeWH)
        collectionView.collectionViewLayout = layout
    }

    
    func getData() {
        if let album,
           let albumID = album["id"].int {
            
            NetworkService.getPhotos(albumID: albumID) { [weak self] response, error in
                guard let photos = response else { return }
                self?.photos = photos
                self?.collectionView.reloadData()
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCVCell", for: indexPath) as? PhotoCVCell else { return UICollectionViewCell() }
        
        let thumbnailUrl = photos[indexPath.row]["thumbnailUrl"].string
        cell.thumbnailUrl = thumbnailUrl
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPhoto", sender: photos[indexPath.row])
    }
    
    // MARK: - Navigation -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoVC = segue.destination as? PhotoVC,
           let photo = sender as? JSON {
            photoVC.photo = photo
        }
    }
    
    
}
