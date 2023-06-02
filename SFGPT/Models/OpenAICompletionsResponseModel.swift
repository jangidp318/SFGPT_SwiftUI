//
//  OpenAICompletionsResponseModel.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import Foundation

struct OpenAICompletionsResponse: Decodable{
    let id: String
    let choices: [OpenAICompletionChoice]
}
