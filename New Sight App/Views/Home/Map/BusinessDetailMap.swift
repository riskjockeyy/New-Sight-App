//
//  BusinessDetailMap.swift
//  New Sight App
//
//  Created by Bharat Singh on 26/11/21.
//

import Foundation
import SwiftUI
import MapKit


struct BusinessDetailMap: UIViewRepresentable {
    
  //  @Binding var isDirectionViewShowing = false
    
    func makeUIView(context: Context) -> MKMapView {
            
        let mapView = MKMapView()
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
            
    }
}
