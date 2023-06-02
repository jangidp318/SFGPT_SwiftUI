//
//  OpenAIService.swift
//  SFGPT
//
//  Created by OSlash on 23/05/23.
//

import Foundation
import Alamofire
import Combine

class OpenAIServiceViewModel {
    let baseUrl = "https://api.openai.com/v1/"
    
    func sendMessage(message: String) -> AnyPublisher<OpenAICompletionsResponse, Error>  {
        let body = OpenAICompletionsBody(model: "text-davinci-003", prompt: message, temperature: 1, max_tokens: 256)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIAPIKey)"
        ]
        
        return Future { [weak self] promise in
            guard let self = self else { return }
            AF.request(baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: OpenAICompletionsResponse.self){
                response in
                switch response.result {
                case .success(let result):
                    promise(.success(result))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}


