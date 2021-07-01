//
//  Models.swift
//  LearningApp
//
//  Created by Lucky Osunbiyi on 2021-06-30.
//

import Foundation

class Module : Identifiable, Decodable { 
    
    var id : Int
    var category : String
    var content : Content
    var test : Test
}


class Content : Decodable, Identifiable {
    var id : Int
    var image : String
    var time: String
    var description : String
    var lessons : [Lesson]
}


struct Lesson : Decodable, Identifiable {
    var id : Int
    var title : String
    var video : String
    var duration : String
    var explanation : String
}


struct Test : Decodable, Identifiable {
    var id : Int
    var image : String
    var time : String
    var description : String
    var questions : [Question]
}

struct Question : Decodable, Identifiable {
    
    var id : Int
    var content : String
    var correctIndex : Int
    var answers : [String]
    
}
