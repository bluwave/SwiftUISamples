//
//  CircleProgressViewDemo.swift
//  SwiftUISamples
//
//  Created by Garrett Richards on 6/5/19.
//  Copyright © 2019 Acme. All rights reserved.
//

import Foundation
import SwiftUI

struct CircleProgressViewDemo : View {
    @State var currentProgress: Length = 0
    private var radius: Length = 100
    var body: some View {
        let timer = Timer(timeInterval: 0.2, repeats: true, block: { timer in
            withAnimation { self.currentProgress += 0.01 }
            if self.currentProgress >= 1.0 { timer.invalidate() }
        }
        )
        return ZStack {
            Color.white
            CircularProgressView(progress: 1.0, radius: radius, strokeWidth: 5, strokeColor: Color(Color.RGBColorSpace.sRGB, white: 0.95, opacity: 1.0 ))
            CircularProgressView(progress: currentProgress, radius: radius, strokeWidth: 1, strokeColor: .red)
            }
            .tapAction {
                withAnimation {
                    self.currentProgress += 0.25
                }
            }.onAppear {
                RunLoop.current.add(timer, forMode: .default)
            }
            .onDisappear {
                timer.invalidate()
        }
    }
}

#if DEBUG
struct CircleProgressViewDemo_Previews : PreviewProvider {
    static var previews: some View {
        CircleProgressViewDemo()
    }
}
#endif
