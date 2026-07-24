//
//  ValueIndicators.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 22/07/26.
//

import SwiftUI

struct ValueIndicators: View {
    @State private var batteryLevel = 0.4
    
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0
    
    @State private var progress = 0.05
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    var body: some View {
        Gauge(value: batteryLevel){
            Text("Battery Level")
        }
        
        Gauge(value: current, in: minValue...maxValue) {
                    Text("BPM")
                } currentValueLabel: {
                    Text("\(Int(current))")
                } minimumValueLabel: {
                    Text("\(Int(minValue))")
                } maximumValueLabel: {
                    Text("\(Int(maxValue))")
                }
                .gaugeStyle(.accessoryCircular)
        
        Gauge(value: current, in: minValue...maxValue) {
    
                } currentValueLabel: {
                    Text("\(Int(current))")
                        .foregroundColor(Color.green)
                } minimumValueLabel: {
                    Text("\(Int(minValue))")
                        .foregroundColor(Color.green)
                } maximumValueLabel: {
                    Text("\(Int(maxValue))")
                        .foregroundColor(Color.red)
                }
                .gaugeStyle(.accessoryCircular)
            
        Gauge(value: current, in: minValue...maxValue) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                } currentValueLabel: {
                    Text("\(Int(current))")
                        .foregroundColor(Color.green)
                } minimumValueLabel: {
                    Text("\(Int(minValue))")
                        .foregroundColor(Color.green)
                } maximumValueLabel: {
                    Text("\(Int(maxValue))")
                        .foregroundColor(Color.red)
                }
                .gaugeStyle(.accessoryCircularCapacity)
        
        VStack {
                    ProgressView(value: progress)
                    Button("More") { progress += 0.05 }
                .controlSize(.mini)
                }
       
        ContentUnavailableView("No Messages", systemImage: "message")
        
        ContentUnavailableView {
            Label("No Mail", systemImage: "tray.fill")
        } description: {
            Text("New mails you receive will appear here.")
        }
        
        ContentUnavailableView.search
        
        
    }
}

#Preview {
    ValueIndicators()
}
