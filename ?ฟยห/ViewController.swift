//
//  ViewController.swift
//  ?ฟยห
//
//  Created by Akekapon Suebprom on 18/9/59.
//  Copyright © พ.ศ. 2559 kratostracking. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var txtLon: UITextField!
    @IBOutlet weak var txtLat: UITextField!
    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.hideKeyBoard()
        //let tab:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "hideKeyBoard")
        
        //view.addGestureRecognizer(tap)
        
        
    }
    
    func hideKeyBoard(){
        view.endEditing(true)
    }
    @IBAction func plotLocationInMapp(_ sender: AnyObject) {
        let addLat = Double(txtLat.text!)
        let addLon = Double(txtLon.text!)
        view.endEditing(true)
        
        let latitude : CLLocationDegrees = addLat!
        let longtitude : CLLocationDegrees = addLon!
        let latDelta : CLLocationDegrees = 0.08
        let lonDelta : CLLocationDegrees = 0.08
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let regin : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(regin, animated: true)
        
        let anotation = MKPointAnnotation()
        anotation.title = "Kratos Tracking"
        anotation.subtitle = "GPS Tracking"
        anotation.coordinate = location
        
        map.addAnnotation(anotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

