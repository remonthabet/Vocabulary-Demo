//
//  OnboardingViewModel.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import Foundation
import SwiftUI

struct OnboardingStep {
    let title: String
    let type: StepType
    let options: [String]?

    enum StepType {
        case textField(placeholder: String, keyboardType: UIKeyboardType)
        case radioButton
    }
}

class OnboardingViewModel: ObservableObject {

    
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var level: String = ""
    @Published var goal: String = ""
    @Published var interest: String = ""

    @Published var navigateToHome = false
    @Published var wordList: [WordEntity] = []
    @Published var errorMessage: String = ""
    @Published var hasError: Bool = false
    private let getWordsUseCase: GetWordsUseCase


    let steps: [OnboardingStep] = [
        OnboardingStep(title: "Enter Your Name", type: .textField(placeholder: "Your name", keyboardType: .default), options: nil),
        OnboardingStep(title: "Enter Your Age", type: .textField(placeholder: "Your age", keyboardType: .numberPad), options: nil),
        OnboardingStep(title: "Choose Your Level", type: .radioButton, options: ["Beginner", "Intermediate", "Advanced"]),
        OnboardingStep(title: "Choose Your Goal", type: .radioButton, options: ["Improve my job", "Ready for test", "Enhance my language", "Others"]),
        OnboardingStep(title: "Choose Your Interest", type: .radioButton, options: ["Business", "Human body", "Emotions", "Others"])
    ]

    init(getWordsUseCase: GetWordsUseCase = GetWordsUseCase()) {
        self.getWordsUseCase = getWordsUseCase
    }

    func fetchWords() {
        // we will fetch the words from just mock repo not from API
        // here we can use the user input (name, age, etc..) to send to our Backend sys to get the correct word list
        Task {
            do {
                let words = try await getWordsUseCase.fetch()
                DispatchQueue.main.async {
                    self.wordList = words
                    self.navigateToHome = true
                }
            } catch {
                DispatchQueue.main.async {
                    self.hasError = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }

    func isCurrentStepValid(stepIndex: Int) -> Bool {
        let values = [name, age, level, goal, interest]
        return !values[stepIndex].isEmpty
    }


}
