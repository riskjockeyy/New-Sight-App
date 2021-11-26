//
//  HomeView.swift
//  New Sight App
//
//  Created by Bharat Singh on 24/11/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    @State var mapShowing = false
    @State var selectedBusness:Business?
    var body: some View {
        
        NavigationView {
        if model.sights.count != 0 || model.restaurents.count != 0 {
    
            if !mapShowing {
                VStack {
                    HStack {
                        
                        Image(systemName: "location")
                        Text("Waterloo")
                        Spacer()
                        
                        Button {
                            mapShowing = true
                        } label: {
                            Text("Switch to map view")
                        }
                    }
                    Divider()
                    
                    BusinessList()
                        .padding(.horizontal)
                }
                
            }
            
            
            else {
                
                ZStack(alignment: .top) {
                    BusinessMap(selctedBusiness: $selectedBusness)
                    .ignoresSafeArea()
                    .sheet(item: $selectedBusness) { business in
                        BusinessDetail(business: business)
                    }
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 48)
                            .cornerRadius(5)
                            .padding()
                        HStack {
                            
                            Image(systemName: "location")
                            Text("Waterloo")
                            Spacer()
                            
                            Button {
                                mapShowing = false
                            } label: {
                                Text("Switch to map view")
                            }
                        }
                        .padding(.horizontal)

                    }

                }
                .navigationBarHidden(true)
                
                    
            }
            
            
        }
               
        
        else {
            ProgressView()
        }
        
        
        
        }
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
