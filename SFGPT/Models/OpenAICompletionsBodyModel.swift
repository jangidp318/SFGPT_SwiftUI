//
//  OpenAICompletionsBodyModel.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import Foundation

struct OpenAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}
