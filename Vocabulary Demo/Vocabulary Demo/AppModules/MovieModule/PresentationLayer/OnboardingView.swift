//
//  OnboardingView.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import SwiftUI
import CoreData

struct OnboardingView: View {
    @State private var currentIndex = 0
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some View {
            NavigationView {
                VStack {
                    Spacer()
                    
                    // Title
                    Text(viewModel.steps[currentIndex].title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    // User input fields
                    if case let .textField(placeholder, keyboardType) = viewModel.steps[currentIndex].type {
                        TextField(placeholder, text: bindingValues())
                            .padding()
                            .font(.system(size: 20)) // Bigger text
                            .frame(height: 50)
                            .background(Color.white)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                            .keyboardType(keyboardType)
                            .padding(.horizontal)
                    } else if case .radioButton = viewModel.steps[currentIndex].type, let options = viewModel.steps[currentIndex].options {
                        ForEach(options, id: \.self) { option in
                            RadioButton(title: option, selected: bindingValues())
                        }
                    }
                    
                    Spacer()
                    
                    // Navigation Buttons
                    navigationButtons
                    
                    // Navigation Link to HomeView
                    NavigationLink("", destination: HomeView(viewModel: viewModel), isActive: $viewModel.navigateToHome)
                        .hidden()
                }
                .padding()
                .background(Color("bg-color"))
            }

      }

    var navigationButtons: some View{
        HStack {
            if currentIndex > 0 {
                Button(action: {
                    withAnimation { currentIndex -= 1 }
                }) {
                    Text("Back")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                }
                .padding(.horizontal)
            }

            Button(action: {
                withAnimation {
                    if currentIndex < viewModel.steps.count - 1 {
                        currentIndex += 1
                    } else {
                        submitUserDataToFetchWords()
                    }
                }
            }) {
                Text(currentIndex == viewModel.steps.count - 1 ? "Get Started" : "Next")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                    .opacity(viewModel.isCurrentStepValid(stepIndex: currentIndex) ? 1.0 : 0.5) // Dimmed if input is missing

            }
            .padding(.horizontal)
            .disabled(!viewModel.isCurrentStepValid(stepIndex: currentIndex)) // Disable if input is missing

        }
        .padding(.vertical)
    }

    // MARK: - Dynamic Bindings
    private func bindingValues() -> Binding<String> {
        let bindings: [Binding<String>] = [
            $viewModel.name,
            $viewModel.age,
            $viewModel.level,
            $viewModel.goal,
            $viewModel.interest
        ]
        return bindings.indices.contains(currentIndex) ? bindings[currentIndex] : .constant("")
    }

    // Submit user data (Example: send to an API)
    private func submitUserDataToFetchWords() {
        viewModel.fetchWords()
    }
}



#Preview {
    OnboardingView()
}
