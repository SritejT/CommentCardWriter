//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var comment = Comment()
    @State private var textFieldOpacity = 0.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField(
                "Comment for subject:",
                text: $comment.text
            ).opacity(textFieldOpacity)
            
            Button(
                "Generate Comment",
                action: {
                    comment.generateRandomComment()
                    textFieldOpacity = 1
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
