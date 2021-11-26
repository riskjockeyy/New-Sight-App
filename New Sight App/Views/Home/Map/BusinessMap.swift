//
//  BusinessMap.swift
//  New Sight App
//
//  Created by Bharat Singh on 25/11/21.
//


import MapKit
import SwiftUI

struct BusinessMap: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    @Binding var selctedBusiness: Business?
    
    var locations:[MKPointAnnotation] {
        
        var annotaions = [MKPointAnnotation]()
        
        for business in model.restaurents + model.sights {
            if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude! {
                
                let a = MKPointAnnotation()
                
                a.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                a.title = business.name ?? ""
                
                annotaions.append(a)
            }
        }
        
        return annotaions
    }
    
        func makeUIView(context: Context) -> MKMapView {
            
        let mapView = MKMapView()
            
            mapView.delegate = context.coordinator
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        uiView.removeAnnotations(uiView.annotations)
        
        uiView.showAnnotations(locations, animated: true)
    }
    
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        
        return Coordinator(map: self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var map: BusinessMap
        init(map: BusinessMap) {
            self.map = map
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            if annotation is MKUserLocation {
                return nil
            }
         var annotationView =   mapView.dequeueReusableAnnotationView(withIdentifier: Constant.annotationReusedId)
            
            if annotationView == nil {
                
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constant.annotationReusedId)
                
                annotationView!.canShowCallout = true
                annotationView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            else {
                annotationView?.annotation = annotation
            }
            
        return annotationView
            
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            for business in map.model.restaurents + map.model.sights {
                
                if business.name == view.annotation?.title {
                    
                    map.selctedBusiness = business
                    return
                }
             }
        }
    }
}
