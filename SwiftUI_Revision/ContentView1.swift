//
//  ContentView1.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 16/07/26.
//

import SwiftUI

struct ContentView1: View {
    var attributedString = try! AttributedString(
        markdown: "AMAY RAJ SRIVASTAV")
    init() {
        if let range = attributedString.range(of: "RAJ"){
            attributedString[range].foregroundColor = .red
        }
    }
    
    var body: some View {
        Text(attributedString)
        
        Text("To be, or not to be, that is the question:")
        Text("To be, or not to be, that is the question:")
            .frame(width: 100)
        Text("Hello my name is Amay and i am learning SwiftUi right now and it is full of fun. I am learning it enthusiastically")
            .lineLimit(2)
            .frame(maxWidth: 200)
        Text("Pneumono ultramicroscopic silicovolcano coniosis yes true and this is the beauty of this ")
            .lineLimit(1)
            .minimumScaleFactor(0.5)
        
        VStack {
            Text("This is a wide text element")
                .font(.body)
                .frame(width: 200, height: 50, alignment: .leading)
                .lineLimit(1)
                .allowsTightening(true)


            Text("This is a wide text element")
                .font(.body)
                .frame(width: 200, height: 50, alignment: .leading)
                .lineLimit(1)
                .allowsTightening(false)
        }
        Text("I've been drinking more alcohol for the past 5 days did you looked on me, did you checked on me, I walked in the room")
            .frame(width: 300, height: 150)
            .lineLimit(1)
            .truncationMode(.tail)
        
        Text(verbatim: "Brother")
       
        
        
        
    }
}

struct RedBorderLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .border(Color.red)
    }
}


#Preview {
    ContentView1()
}
