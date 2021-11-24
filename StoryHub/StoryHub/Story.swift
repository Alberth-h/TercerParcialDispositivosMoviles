//
//  Story.swift
//  StoryHub
//
//  Created by Alberto Hoyos on 21/11/21.
//

import Foundation

class Story {
    var id : String
    var title : String
    var author : String
    var date : String
    var category : String
    var country : String
    var language : String
    var phone : String
    var email : String
    var content : String

    init(id: String, title: String, author: String, date: String, category: String, country: String, language: String, phone: String, email: String, content:String){
        self.id = id
        self.title = title
        self.author = author
        self.date = date
        self.category = category
        self.country = country
        self.language = language
        self.phone = phone
        self.email = email
        self.content = content
    }
}
