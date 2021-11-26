//
//  ContentView.swift
//  New Sight App
//
//  Created by Bharat Singh on 23/11/21.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        
        if model.locationState == .notDetermined {
            
            // show onboarding view
        }
        
        else if model.locationState == .authorizedWhenInUse ||
                    model.locationState == .authorizedAlways {
            
            // show home screen
            HomeView()
        }
        
        else if model.locationState == .denied {
            //show denied view
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
