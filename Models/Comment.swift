//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import Foundation

class Comment: ObservableObject {
    @Published var text = "This is a comment."
    var possibleComments = ["Comment1", "Comment2", "Comment3", "Comment4", "Comment5"]
    
    func generateRandomComment() {
        self.text = self.possibleComments[Int.random(in: 0..<5)]
    }
}
