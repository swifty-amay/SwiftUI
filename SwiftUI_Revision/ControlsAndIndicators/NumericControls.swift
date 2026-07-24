//
//  NumericControls.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 21/07/26.
//

import SwiftUI

struct NumericControls: View {
    
    @State private var speed = 50.0
    @State private var value = 2.0
    @State private var stepCount = 0
    @State private var isEditing = false
    @State private var vibrateOnRing = false
    
    var body: some View {
        Slider(value: $speed, in: 0...100, step: 10, onEditingChanged: {editing in
            isEditing = editing})
        Text("\(speed)")
                    .foregroundColor(isEditing ? .red : .blue)
        
        Slider(value: $value) {
            Text("Progress")
        } ticks: {
            SliderTick(0)
            SliderTick(0.5)
            SliderTick(1)
        }
        Stepper(value: $stepCount, in: 1...10, step: 2){
            Text("\(stepCount)")
        }
        Stepper{
            Text("\(stepCount)")
        } onIncrement: {
            print("Increment")
        } onDecrement: {
            print("Decrement")
        }
        
        Toggle(isOn: $vibrateOnRing){
            Text("Vibrate on ring")
        }
        Toggle(
                "Vibrate on Ring",
                systemImage: "dot.radiowaves.left.and.right",
                isOn: $vibrateOnRing
            )
        
        Toggle(isOn: $vibrateOnRing) {
                Text("Vibrate on Ring")
                Text("Enable vibration when the phone rings")
            }
        .toggleStyle(.switch)
    }
}

#Preview {
    NumericControls()
}
