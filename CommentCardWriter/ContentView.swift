//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var comment = Comment()
    @State private var preference = 5.0
    @State private var subject = "subject"
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            TextField(
                "Enter subject here...",
                text: $subject,
                onEditingChanged:{ _ in
                    comment.preference = preference
                    comment.generatePreferenceComment()
                }
            )
                .border(.secondary)
                
            Slider(
                value: $preference,
                in: 0...10,
                onEditingChanged: { _ in
                    comment.preference = preference
                    comment.generatePreferenceComment()
                }
            )
            Text(comment.text)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
