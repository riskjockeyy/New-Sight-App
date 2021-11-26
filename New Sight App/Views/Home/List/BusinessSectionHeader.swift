//
//  BusinessSectionHeader.swift
//  New Sight App
//
//  Created by Bharat Singh on 25/11/21.
//

import SwiftUI

struct BusinessSectionHeader: View {
    var title: String
    var body: some View {
        
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
            Text(title)
                .bold()
        }
    }
}


