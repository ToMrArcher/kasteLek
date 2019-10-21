//
//  Question.swift
//  Kasteleken
//
//  Created by Syvert Andreas Eidjord on 13/09/2019.
//  Copyright © 2019 Eidjord Marketing. All rights reserved.
//

import Foundation

class Question {
    
    enum QuestionType {
        case kaste
        case challenge
    }
    
    let questionText : String
    let questionType : QuestionType
    
    init(text: String, type: QuestionType) {
        questionText = text
        questionType = type
    }
    
}
