//
//  BusinessDetail.swift
//  New Sight App
//
//  Created by Bharat Singh on 25/11/21.
//

import SwiftUI

struct BusinessDetail: View {
    @EnvironmentObject var model: ContentModel
    
    var business: Business
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(spacing: 0) {
            GeometryReader { geo in
                let uiImage = UIImage(data: business.imageData ?? Data() )
                
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .scaledToFit()
                    .clipped()
            }
            .ignoresSafeArea(.all, edges: .top)
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .frame(height: 35)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                        
                }
            }
            
            Group {
                Text(business.name ?? "")
                    .font(.largeTitle)
                    .padding()
                
                ForEach(business.location!.displayAddress!, id: \.self) { address in
                    
                    Text(address)
                        .padding(.horizontal)
                }
                
                Image("regular_\(business.reviewCount ?? 0)")
                    .padding()
                DashDivider()
                    .padding(.horizontal)
                HStack {
                    
                    Text("Phone")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel\(business.phone ?? "" )")!)
                }
                .padding()
                
                DashDivider()
                    .padding(.horizontal)
                HStack {
                    Text("Website")
                        .bold()
                    
                    Spacer()
                    
                    Link("Visit", destination: URL(string: business.url ?? "")!)
                }
                .padding(.horizontal)
            }
            DashDivider()
            
            
            Button {
                
            } label: {
                ZStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 48)
                    .cornerRadius(10)
                    
                    Text("Get Directoins")
                        .foregroundColor(.white)
                        .bold()
                }
                .padding()
            }

           
        }
        
    }
}


