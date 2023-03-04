//
//  ContentView.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var commentList: [Comment] = []
    
    var body: some View {
        ScrollView(.vertical) {
            Spacer()
            ForEach(0..<commentList.count, id: \.self) {
                CommentView()
                    .environmentObject(commentList[$0])
                Divider()
            }
            
            Button("Add Comment", action: {
                commentList.append(Comment())
            })
            Button("Delete Last Comment", action: {
                commentList.popLast()
            })
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
