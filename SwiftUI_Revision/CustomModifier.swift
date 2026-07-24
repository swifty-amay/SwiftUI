//
//  CustomModifier.swift
//  SwiftUI_Revision
//
//  Created by Amay Raj Srivastav on 16/07/26.
//

import Foundation
import SwiftUI

struct headlineCyan: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.cyan)
    }
}

extension View{
    func headlinecyan() -> some View{
        modifier(headlineCyan())
    }
}
