//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import Foundation

class Comment: ObservableObject {
    @Published var text = ""
    var preference = 5.0
    var subject = ""
    
    var possibleComments = ["Comment1", "Comment2", "Comment3", "Comment4", "Comment5"]
    
    func generateRandomComment() {
        self.text = self.possibleComments[Int.random(in: 0..<5)]
    }
    
    func generatePreferenceComment() {
        if preference > 7 {
            text = "I am loving \(subject)!"
        } else if preference <= 7 && preference >= 3 {
            text = "I think \(subject) is ok."
        } else {
            text = "I hate \(subject)!"
        }
    }
}
