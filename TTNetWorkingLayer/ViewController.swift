//
//  ViewController.swift
//  TTNetWorkingLayer
//
//  Created by Than Trong Tuan on 11/1/19.
//  Copyright © 2019 Than Trong Tuan. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func handleService(_ sender: Any) {
        getPlaceholder()
        //getPlaceholderWithPromise()
    }
    
    func getQuestion() {
        QuestionService.getQuestion { response in
            switch response.result {
            case .success(let question):
                print(question.messages)
                print(question.question)
            case . failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getQuestionWithPromise() {
        firstly {
            return QuestionService.getQuestionWithPromise()
            }.done { question in
                print(question.messages)
                print(question.question)
            }.catch { (error) in
                print(error.localizedDescription)
        }
    }
    
    func getPlaceholder() {
        PlaceholderService.getPlaceholder { response in
            switch response.result {
            case .success(let placeholders):
                print("placeholder.count: \(placeholders.count)")
                for i in 0..<placeholders.count {
                    print("\(i): \(placeholders[i].title)")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPlaceholderWithPromise() {
        firstly {
            return PlaceholderService.getPlaceholderWithPromise()
            }.done { placeholders in
                print("placeholder.count: \(placeholders.count)")
                for i in 0..<placeholders.count {
                    print("\(i): \(placeholders[i].title)")
                }
            }.catch { error in
                print(error.localizedDescription)
        }
    }
    
}

