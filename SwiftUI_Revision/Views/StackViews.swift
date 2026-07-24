//
//  StackViews.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 23/07/26.
//

import SwiftUI
struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("ProfilePicture")
                .resizable()
//                .frame(width: 300, height: 400)
                .aspectRatio(contentMode: .fit)
//                .cornerRadius(10)
            HStack(){
                VStack(alignment: .leading){
                   Text("Amay Raj Srivastav")
                        .font(.headline)
                   Text("Software Developer")
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .background(Color.primary.colorInvert().opacity(0.75))
//            .frame(width: 300)
        }
//        .frame(width: 350, height: 480)
        Divider()
            .frame(width: 310)
            
    }
}
struct StackViews: View {
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 10){
            ForEach(1...5, id: \.self){
                Text("Item \($0)")
            }
        }
        HStack(alignment: .top, spacing: 10){
            ForEach(1...5, id: \.self){
                Text("Item \($0)")
            }
        }
        VStack(alignment: .leading, spacing: 10){
            ForEach(1...5, id: \.self){
                Text("Item \($0)")
            }
        }
        
        ScrollView(.horizontal){
            LazyHStack(alignment: .top, spacing: 10){
                ForEach(1...100, id: \.self){
                    Text("Item \($0)")
                }
            }
        }
        
        ScrollView(.vertical){
            LazyVStack(alignment: .leading, spacing: 10){
                ForEach(1...100, id: \.self){
                    Text("Item \($0)")
                }
            }
        }
        
    }
}

struct ColorData: Identifiable{
    let id = UUID()
    let name: String
    let color: Color
    let variantions: [ShadeData]
    
    struct ShadeData: Identifiable{
        let id=UUID()
        var brightness: Double
        
    }
    init(name: String, color: Color) {
        self.name = name
        self.color = color
        self.variantions = stride(from: 0.0, to: 0.5, by: 0.1).map{ShadeData(brightness: $0)}
    }
}

struct ColorSelectionView: View {
    let sections = [
        ColorData(name: "Reds", color: .red),
        ColorData(name: "Greens", color: .green),
        ColorData(name: "Blues", color: .blue)
    ]
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]){
                ForEach(sections){section in
                    Section(header: SectionHeaderView(colorData: section)){
                        ForEach(section.variantions){variation in
                            section.color
                                .brightness(variation.brightness)
                                .frame(height: 20)
                        }
                    }
                }
            }
        }
    }
}

struct SectionHeaderView: View {
    var colorData: ColorData
    var body: some View {
        HStack{
            Text(colorData.name)
                .font(.headline)
                .foregroundColor(colorData.color)
            Spacer()
        }
        .padding()
        .background(Color.primary.colorInvert().opacity(0.75))
    }
}

struct ScrollableProfileView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ProfileView()
                ProfileView()
                ProfileView()
                ProfileView()
                ProfileView()
                ProfileView()
            }
        }
        .frame(maxWidth: 500)

    }
}
#Preview {
//    ColorSelectionView()
    ScrollableProfileView()
}
