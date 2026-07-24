//
//  LazyGridViews.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 24/07/26.
//

import SwiftUI

struct LazyGridViews: View {
    
    let rows = [
           GridItem(.fixed(30), spacing: 1),
           GridItem(.fixed(60), spacing: 10),
           GridItem(.fixed(90), spacing: 20),
           GridItem(.fixed(10), spacing: 0)
       ]
    let rows1 = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, spacing: 5) {
                        ForEach(0...300, id: \.self) { _ in
                            Color.red.frame(width: 30)
                            Color.green.frame(width: 30)
                            Color.blue.frame(width: 30)
                            Color.yellow.frame(width: 30)
                        }
                    }
                }
        
        ScrollView(.horizontal) {
                    LazyHGrid(rows: rows1) {
                        ForEach(0x1f600...0x1f679, id: \.self) { value in
                            Text(String(format: "%x", value))
                            Text(emoji(value))
                                .font(.largeTitle)
                        }
                    }
                }
        
        
        ScrollView {
                     LazyVGrid(columns: columns) {
                         ForEach(0x1f600...0x1f679, id: \.self) { value in
                             Text(String(format: "%x", value))
                             Text(emoji(value))
                                 .font(.largeTitle)
                         }
                     }
                 }

    }
    private func emoji(_ value: Int) -> String {
            guard let scalar = UnicodeScalar(value) else { return "?" }
            return String(Character(scalar))
        }
}

#Preview {
    LazyGridViews()
}
