//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Tummuru, Sritej (Coll) on 04/02/2023.
//

import Foundation

class Comment: ObservableObject {
    @Published var text = "Create your comment!"
    var subjectPreference = 5.0
    var teacherPreference = 5.0
    var subject = ""
    var teacher = ""
    
    var possibleComments = ["Comment1", "Comment2", "Comment3", "Comment4", "Comment5"]
    
    func generateRandomComment() {
        self.text = self.possibleComments[Int.random(in: 0..<5)]
    }
    
    func generatePreferenceComment() {
        if subjectPreference > 7 {
            text = "I am loving \(subject)!"
        } else if subjectPreference <= 7 && subjectPreference >= 3 {
            text = "I think \(subject) is ok."
        } else {
            text = "I hate \(subject)!"
        }
        
        if teacherPreference > 7 {
            text += " I think \(teacher) is a good teacher."
        } else if teacherPreference <= 7 && teacherPreference >= 3 {
            text += " I think \(teacher) is an ok teacher."
        } else {
            text += " I think \(teacher) could improve their teaching."
        }
        
    }
}
