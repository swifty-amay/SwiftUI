//
//  Menus.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 22/07/26.
//

import SwiftUI

struct Menus: View {
    @State private var value = false
    var body: some View {
        Menu{
            Button(action: {print("listen")}){
                Text("Open in Preview")
                Text("View the document in Preview")
            }
            Button("Read", action: {})
            Button("Write", action: {})
            Button("Speak", action: {})
            Menu("Copy"){
                Button("Copy", action: {})
            }
        } label: {
            Label("PDF", systemImage: "doc.fill")
        }
        
        Menu {
            Button(action: {print("add reading to a list")}) {
                Label("Add to Reading List", systemImage: "eyeglasses")
            }
            Button(action: {}) {
                Label("Add Bookmarks for All Tabs", systemImage: "book")
            }
            Button(action: {}) {
                Label("Show All Bookmarks", systemImage: "books.vertical")
            }
        } label: {
            Label("Add Bookmark", systemImage: "book")
        } primaryAction: {
            print("Add bookmark")
        }
        .menuStyle(.button)
        
        Menu("Actions") {
            Button("Duplicate", systemImage: "doc.on.doc") {
                // Duplicate action.
            }
            Button("Rename", systemImage: "pencil") {
                // Rename action.
            }
            Button("Delete…", systemImage: "trash") {
                // Delete action.
            }
        }
        
        Menu("Actions") {
            Button {
                // Duplicate action.
            } label: {
                Text("Duplicate")
                Text("Duplicate the component")
            }
            Button {
                // Rename action.
            } label: {
                Text("Rename")
                Text("Rename the component")
            }
            Button(role: .destructive) {
                // Delete action.
            } label: {
                Text("Delete…")
                Text("Delete the component")
            }
            Toggle(isOn: $value) {
                    Label("Favorite", systemImage: "suit.heart")
                    Text("Adds the component to the favorites list")
                }
        }
        
        Menu("Setting"){
            Section("General Settings"){
                Button("WiFi", action: {})
                Button("Bluetooth", action: {})
                Button("Notification", action: {})
            }
            Section("Account Settings"){
                Button("Profile", action: {})
                Button("Security", action: {})
                Button("Privacy", action: {})
            }
            Section("Advanced Settings"){
                Button("Developer Options", action: {})
                Button("System Resource", action: {})
                Button("Backup & Restore", action: {})
            }
        }
        Menu("Edit") {
            ControlGroup {
                Button {
                    // Undo action
                } label: {
                    Label("Undo", systemImage: "arrow.uturn.backward")
                }
                
                Button {
                    // Redo action
                } label: {
                    Label("Redo", systemImage: "arrow.uturn.forward")
                }
                
                Button {
                    // Copy action
                } label: {
                    Label("Copy", systemImage: "doc.on.doc")
                }
            }
            
            Divider()
            
            Button("Something"){}
            // Additional menu items here...
        }
        
        Menu("Font size") {
            Button(action: {}) {
                Label("Increase", systemImage: "plus.magnifyingglass")
            }
            .menuActionDismissBehavior(.disabled)
            Button("Reset", action: {})
            Button(action: {}) {
                Label("Decrease", systemImage: "minus.magnifyingglass")
            }
            .menuActionDismissBehavior(.disabled)
        }
    }
}

#Preview {
    Menus()
}
