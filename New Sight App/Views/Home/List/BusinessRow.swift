//
//  BusinessRow.swift
//  New Sight App
//
//  Created by Bharat Singh on 25/11/21.
//

import SwiftUI

struct BusinessRow: View {
    var business: Business
    var body: some View {
        HStack {
            // image
            let uiImage = UIImage(data: business.imageData ?? Data())
            
            Image(uiImage: uiImage ??  UIImage())
                .resizable()
                .frame(width:58, height: 58)
                .cornerRadius(5)
                .scaledToFit()
            VStack(alignment: .leading) {
                
                Text(business.name ?? "")
                
                Text(String(format: "%.1f KM away", (business.distance ?? 0)/1000))
            }
            
            Spacer()
            // satar rating and number of reviews
            VStack(alignment: .leading) {
            Image("regular_\(business.rating ?? 0)")
                Text("\(business.reviewCount ?? 0) Reviews")
        }
        }
        .navigationBarHidden(true)
        
        
    }
}


