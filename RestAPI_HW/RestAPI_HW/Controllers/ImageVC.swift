//
//  ImageVC.swift
//  RestAPIAppCW
//
//  Created by Vitaliy Halai on 25.12.22.
//

import UIKit

class ImageVC: UIViewController {
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }

    private let imageURLStr = "https://media.wired.com/photos/598e35fb99d76447c4eb1f28/16:9/w_2123,h_1194,c_limit/phonepicutres-TA.jpg"

    private func fetchImage() {
        guard let url = URL(string: imageURLStr) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            DispatchQueue.main.async {
                
                self.activityIndicatorView.stopAnimating()
                
                if let error = error {
                    print(error.localizedDescription)
                    // добавить дефолтную картинку и отобразить ошибку
                    return
                }
                
                if let response {
                    print(response)
                }
                
                print("\n", data ?? "", "\n")
                
                if let data,
                   let image = UIImage(data: data)
                {
                    self.image.image = image
                } else {
                    // добавить дефолтную картинку
                }
                
            }
        }//.resume()
        task.resume()
    }
}
