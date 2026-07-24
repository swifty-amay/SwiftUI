//
//  GridViews.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 24/07/26.
//

import SwiftUI

struct GridViews: View {
    var body: some View {
        
        Grid{
            GridRow{
                Text("Hello")
                    .gridCellColumns(2)
                Image(systemName: "globe")
            }
            .border(.black)
            
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            GridRow{
                Image(systemName: "hand.wave")
                Text("World")
            }
//            .gridCellColumns(2)
            .border(.black)
        }
        Grid {
            GridRow {
                Text("Header")
                    .gridCellColumns(3)
            }
            .border(.black)

            GridRow {
                Text("Amay")
                Text("21")
                Text("India")
            }
            .border(.black)
        }
        Grid(alignment: .bottom, horizontalSpacing: 1, verticalSpacing: 1) {
            GridRow {
                Text("Row 1")
                    .gridColumnAlignment(.trailing)
                ForEach(0..<2) { _ in Color.red }
            }
            GridRow {
                Text("Row 2")
                    .gridCellAnchor(.top)
                ForEach(0..<5) { _ in Color.green }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in Color.blue }
            }
        }
        .aspectRatio(contentMode: .fit)
        
        Grid{
            GridRow{
                Color.clear
                    .gridCellUnsizedAxes([.horizontal, .vertical])
                ForEach(1..<4){column in
                        Text("C\(column)")
                }
            }
            ForEach(1..<4){row in
                GridRow{
                    Text("R\(row)")
                    ForEach(1..<4){column in
                        Circle().foregroundStyle(.mint)
                    }
                }
            }
            
        }
    }
}

#Preview {
    GridViews()
}
