//
//  BusinessSection.swift
//  New Sight App
//
//  Created by Bharat Singh on 25/11/21.
//

import SwiftUI

struct BusinessSection: View {
    var title: String
    var business: [Business]
    var body: some View {
        
        Section(header: BusinessSectionHeader(title: title)) {
            ForEach(business) { business in
                
                NavigationLink {
                    BusinessDetail(business: business)
                } label: {
                    BusinessRow(business: business)
                }
                .accentColor(.black)

               
            }
            
        }
    }
}

