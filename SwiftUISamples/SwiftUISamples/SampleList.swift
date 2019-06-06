//
//  ContentView.swift
//  SwiftUISamples
//
//  Created by Garrett Richards on 6/5/19.
//  Copyright © 2019 Acme. All rights reserved.
//

import SwiftUI

struct SampleList : View {
    var body: some View {
        NavigationView {
            List {
                NavigationButton(destination: CircleProgressViewDemo()) {
                    Text("ProgressCircleView")
                }

                NavigationButton(destination: EmptyView()) {
                    Text("Horizontal Menu")
                }
            }
        }
    }
}

#if DEBUG
struct SampleList_Previews : PreviewProvider {
    static var previews: some View {
        SampleList()
    }
}
#endif
