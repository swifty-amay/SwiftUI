//
//  Link.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 21/07/26.
//

import SwiftUI
import Foundation

struct LinkView: View {
    let photo = Photo(
        image: Image("Image"),
        caption: "My Photo"
    )
    var body: some View {
        Link("Visit Our Site", destination: URL(string: "https://www.example.com")!)
            .environment(\.openURL, OpenURLAction { url in
                print("Open \(url)")
                return .handled
            })
        ShareLink(item: URL(string: "https://developer.apple.com/xcode/swiftui/")!)
        
        ShareLink(item: photo, preview: SharePreview(photo.caption, image: photo.image))
        
    }
}
struct Photo: Transferable{
    static var transferRepresentation: some TransferRepresentation{
        ProxyRepresentation(exporting: \.image)     //sending only image for sharing, no metadata
    }
    
    public var image: Image
    public var caption: String
    }


#Preview {
    LinkView()
}
