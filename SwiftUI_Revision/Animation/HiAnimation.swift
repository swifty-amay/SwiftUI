//
//  HiAnimation.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 08/08/26.
//

import SwiftUI

struct HiAnimation: View {
    let fontSize: CGFloat = 120
    
    @State private var dotOffsetX: CGFloat = 0
    @State private var dotOffsetY: CGFloat = 0
    @State private var trailingSpace: CGFloat = 0
    
    private let outboundPhases: [(dx: CGFloat, y: CGFloat, duration: Double, isRise: Bool)] = [
           (dx: 25,   y: -20, duration: 0.3, isRise: true),   // hop 1: rising
           (dx: 25,   y: 68,   duration: 0.3, isRise: false),  // hop 1: falling
           (dx: 15, y: 25, duration: 0.3, isRise: true),   // hop 2: rising
           (dx: 15, y: 68,   duration: 0.3, isRise: false),  // hop 2: falling
           (dx: 10,   y: 20, duration: 0.3, isRise: true),   // hop 3: rising
           (dx: 10,   y: 68,   duration: 0.3, isRise: false),  // hop 3: falling
           (dx: 6,    y: 15,  duration: 0.3, isRise: true),   // hop 4: rising
           (dx: 6,    y: 68,   duration: 0.3, isRise: false)   // hop 4: falling
       ]
    
    private let restPhase: [(dx: CGFloat, y: CGFloat, duration: Double, isRise: Bool)] = [
            (dx: 6, y: 68, duration: 0.3, isRise: false)
        ]

    private let returnPhases: [(dx: CGFloat, y: CGFloat, duration: Double, isRise: Bool)] = [
            (dx: -6,    y: 68,  duration: 0.30, isRise: true),
            (dx: -6,    y: 15,   duration: 0.30, isRise: false),
            (dx: -10,   y: 68, duration: 0.30, isRise: true),
            (dx: -10,   y: 20,   duration: 0.30, isRise: false),
            (dx: -15, y: 68, duration: 0.30, isRise: true),
            (dx: -15, y: 25,   duration: 0.30, isRise: false),
            (dx: -25,   y: 68, duration: 0.30, isRise: true),
            (dx: -25,   y: -20,   duration: 0.30, isRise: false)
        ]
    
    private var phases: [(dx: CGFloat, y: CGFloat, duration: Double, isRise: Bool)] {
           outboundPhases + restPhase + returnPhases
       }
    
    var body: some View {
        HStack(spacing: 0) {
            Text("H")
                .font(.system(size: 120, weight: .bold, design: .rounded))
            
            ZStack(alignment: .top){
               Capsule()
                    .frame(width: fontSize*0.12, height: fontSize*0.55)
                    .padding(.top, fontSize*0.18)
                
                Circle()
                    .frame(width: fontSize*0.14, height: fontSize*0.14)
                    .offset(x: dotOffsetX, y: dotOffsetY)
            }
            .frame(width: fontSize*0.3, height: fontSize)
            Spacer().frame(width: trailingSpace)
        }
        .foregroundStyle(.primary)
        .onAppear{
            playPhases(startingAt: 0)
        }
    }
    private func playPhases(startingAt index: Int) {
            guard index < phases.count else {
                jumpHome()
                return
            }

            let phase = phases[index]
            let curve: Animation = phase.isRise
                ? .easeOut(duration: phase.duration)
                : .easeIn(duration: phase.duration)

            withAnimation(curve) {
                dotOffsetX += phase.dx
                dotOffsetY = phase.y
                trailingSpace = max(trailingSpace, dotOffsetX)
            }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02 +  phase.duration) {
                playPhases(startingAt: index + 1)
            }
        }
    
    private func jumpHome() {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 12)) {
                dotOffsetX = 0
                dotOffsetY = 0
                trailingSpace = 0
            }
        }

}

#Preview {
    HiAnimation()
}
