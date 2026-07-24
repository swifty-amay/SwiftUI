//
//  Buttons.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 20/07/26.
//

import SwiftUI

struct Buttons: View {
    @State private var fruits = ["Apple", "Banana", "Grapes", "Mango"]
    @Environment(\.editMode) private var editMode
    @State private var name = "Maria Ruiz"
    @State private var pastedText = ""

    var body: some View {
        Button(action: {print("Hello World")}){
            Label("SignUp", systemImage: "arrow.up")
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.roundedRectangle)
        .foregroundStyle(.pink)
        
        
        Button("SignUp", systemImage: "arrow.up", action: {print("Hello")})
        Button(action: {print("SignUp")})
        {
            HStack{
                Text("SignUp")
                Image(systemName: "arrow.up")
            }
        }
        .buttonRepeatBehavior(.enabled)
        .buttonStyle(.bordered)
        .buttonBorderShape(.circle)
        .buttonSizing(.flexible)
        NavigationView{
            List{
                Text("Sunday")
                Text("Monday")
                Text("Tuesday")
                
                Button("Add Day", systemImage: "folder.badge.plus", role: .destructive, action: {print("added a day")})
            }
            .toolbar{
                EditButton()
            }
        }
        
        Button("Somethin"){
            print("")
        }
        .buttonBorderShape(.roundedRectangle)
        .tint(.yellow)
        Button("Somethin"){
            print("")
        }
        .buttonBorderShape(.capsule)
        .tint(.yellow)
        NavigationView{
            Form {
                if editMode?.wrappedValue.isEditing == true {
                    TextField("Name", text: $name)
                } else {
                    Text(name)
                }
            }
            .animation(nil, value: editMode?.wrappedValue)
            .toolbar { // Assumes embedding this view in a NavigationView.
                EditButton()
            }
        }
        
        HStack{
            PasteButton(payloadType: String.self){strings in
                pastedText = strings[0]
            }
            Divider()
            Text(pastedText)
            Spacer()
        }
        
        
    }
    
}



struct ContentView4: View {
    @Environment(\.editMode) private var editMode
    @State private var name = "Maria Ruiz"
    

    var body: some View {
        NavigationView {
            Form {
                if editMode?.wrappedValue.isEditing == true {
                    TextField("Name", text: $name)
                } else {
                    Text(name)
                }
            }
//            .animation(nil, value: editMode?.wrappedValue)
            .navigationTitle("Profile")
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    Buttons()
}


