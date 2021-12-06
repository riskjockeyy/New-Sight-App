//
//  DashDivider.swift
//  New Sight App
//
//  Created by Bharat Singh on 07/12/21.
//

import SwiftUI

struct DashDivider: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geo.size.width, y: 0))
            }
            .stroke(.gray, style: StrokeStyle(lineWidth: 1, dash: [5]))
          

        }
        .frame(height: 1)
    }
}

struct DashDivider_Previews: PreviewProvider {
    static var previews: some View {
        DashDivider()
    }
}
