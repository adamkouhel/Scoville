//
//  MapViewController.swift
//  Scoville
//
//  Created by Adam Kouhel on 12/15/17.
//  Copyright © 2017 AdamKouhel. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location to Marquette University
        let initialLocation = CLLocation(latitude: 43.039011, longitude: -87.929752)
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        
        // show messages on Map
        let message = Message(title: "Your car is located here!", locationName: "Car Location", username: "Adam Kouhel", coordinate: CLLocationCoordinate2D(latitude: 43.014545, longitude: -87.967893), isDisabled: true)
        
        mapView.addAnnotation(message)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
