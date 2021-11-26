//
//  BusinessList.swift
//  New Sight App
//
//  Created by Bharat Singh on 25/11/21.
//

import SwiftUI

struct BusinessList: View {
    @EnvironmentObject var model: ContentModel
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack(alignment: .leading,pinnedViews: .sectionHeaders) {
                
                BusinessSection(title: "Restaurents", business: model.restaurents)
                
                BusinessSection(title: "Sights", business: model.sights)
            }
            
        }
        
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
