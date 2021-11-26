//
//  New_Sight_AppApp.swift
//  New Sight App
//
//  Created by Bharat Singh on 23/11/21.
//

import SwiftUI

@main
struct NewSightApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
