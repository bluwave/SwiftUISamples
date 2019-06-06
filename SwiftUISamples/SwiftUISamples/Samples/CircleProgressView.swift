//
//  CircleProgressView.swift
//  SwiftUISamples
//
//  Created by Garrett Richards on 6/5/19.
//  Copyright © 2019 Acme. All rights reserved.
//
import Foundation
import SwiftUI

struct CircularProgressView: View, Animatable {
    var progress: Length = 0
    var radius: Length = 100
    var strokeWidth: Length = 3
    var strokeColor: Color = .red
    private let startPoint: Length = 0

    private var startingDrawPoint: Length {
        (startPoint - 0.25).toRadians()
    }

    private var endingDrawPoint: Length {
        ((progress - startPoint) - 0.25).toRadians()
    }

    var animatableData: Length {
        get {
            return progress
        }
        set {
            progress = newValue
        }
    }

    var body: some View {
        GeometryReader { reader in
            Path { path in
                let center = CGPoint(x: reader.size.width / 2, y: reader.size.height / 2)
                path.addArc(
                    center: center,
                    radius: self.radius,
                    startAngle: Angle(radians: Double(self.startingDrawPoint)),
                    endAngle: Angle(radians: Double(self.endingDrawPoint)),
                    clockwise: false
                )
                }.stroke(self.strokeColor, lineWidth: self.strokeWidth)
        }
    }
}

extension Length {
    func toRadians() -> Length {
        ((2 * Length.pi) ) * self
    }
}
