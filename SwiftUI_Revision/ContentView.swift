//
//  ContentView.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 16/07/26.
//

import SwiftUI
internal import System

struct ContentView: View {

    var body: some View {
        AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFLBSKIbDXz4UsNIkkLL-QIzZOhE1ruAWYEj_VCMbpQg&s")){phase in
            if let image = phase.image{
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 150)
            } else if phase.error != nil{
                Color.cyan
            } else{
                ProgressView()
            }
        }
        
        
        
        
            
    }
}

#Preview {
    ContentView()
}
