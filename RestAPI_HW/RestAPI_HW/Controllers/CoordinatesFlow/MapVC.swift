//
//  MapVC.swift
//  Vitali's L13_HW
//
//  Created by Vitaliy Halai on 13.11.22.
//

import UIKit
import GoogleMaps

typealias Coords = (CLLocationCoordinate2D) -> Void

class MapVC: UIViewController {
    
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    var user: User?
    
    var transferClosure: Coords!
    var coordinates: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: coordinates?.latitude ?? 0 , longitude: coordinates?.longitude ?? 0, zoom: 2.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        
        coordinates?.latitude = CLLocationDegrees(Double(user?.address?.geo?.lat ?? "") ?? 0)
        coordinates?.longitude = CLLocationDegrees(Double(user?.address?.geo?.lng ?? "") ?? 0)
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinates?.latitude ?? 0, longitude: coordinates?.longitude ?? 0)
        marker.map = mapView
        
        
        mapView.settings.compassButton = true
        //mapView.delegate = self
        view.insertSubview(mapView, at: 0)
        
    }
    @IBAction func confirmCoordsOnClick(_ sender: Any) {
//        guard let coordinatesForTransfer = coordinates else { return }
//        transferClosure(coordinatesForTransfer)
//        dismiss(animated: true)
    }
    
}

//extension MapVC: GMSMapViewDelegate {
//    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D)
//    {
//
//        confirmButton.isHidden = false
//        coordinatesLabel.isHidden = false
//        coordinates = coordinate
//        coordinatesLabel.text = "\(coordinate.latitude); \(coordinate.longitude)"
//    }
//}
