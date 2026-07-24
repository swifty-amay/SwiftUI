//
//  PickersView.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 22/07/26.
//

import SwiftUI

enum Flavor: String, Identifiable, CaseIterable{
    case chocolate, vanilla, strawberry
    var id: Self {self}
}

enum Topping: String, CaseIterable, Identifiable {
    case nuts, cookies, blueberries
    var id: Self { self }
}


extension Flavor {
    var suggestedTopping: Topping {
        switch self {
        case .chocolate: return .nuts
        case .vanilla: return .cookies
        case .strawberry: return .blueberries
        }
    }
}
struct PickersView: View {
    
    @State private var selectedFlavor: Flavor = .chocolate
    @State private var suggestedTopping: Topping = .nuts
    @State private var date = Date()
    @State private var dates: Set<DateComponents> = []
    @State private var bgColor =
           Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    var body: some View {
        
            Picker(selection: $selectedFlavor){
                ForEach(Flavor.allCases){flavor in
                    Text(flavor.rawValue.capitalized).tag(flavor.id)
                }
            } label: {
                Text("Flavor")
                Text("Choose your favourite flavor")
            }
        
        List {
            Picker("Flavor", selection: $suggestedTopping) {
                ForEach(Flavor.allCases) { flavor in
                    Text(flavor.rawValue.capitalized)
                        .tag(flavor.suggestedTopping)
                }
            }
            HStack {
                Text("Suggested Topping")
                Spacer()
                Text(suggestedTopping.rawValue.capitalized)
                    .foregroundStyle(.secondary)
            }
            
        }
        .pickerStyle(.wheel)
        
        DatePicker("Start Date", selection: $date, displayedComponents: [.date])
        
        
        DatePicker(selection: $date) {
                Text("Start Date")
                Text("Select the starting date for the event")
            }
        
        VStack {
                    ColorPicker("Alignment Guides", selection: $bgColor)
                }
        
//        MultiDatePicker("Dates Available", selection: $dates)
        
    }
}

#Preview {
    PickersView()
}
