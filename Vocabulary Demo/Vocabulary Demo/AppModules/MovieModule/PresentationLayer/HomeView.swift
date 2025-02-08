//
//  HomeView.swift
//  Vocabulary Demo
//
//  Created by remon on 08/02/2025.
//

import SwiftUI



struct HomeView: View {

    @State private var currentIndex = 0
    @ObservedObject var viewModel : OnboardingViewModel

    var body: some View {
        VStack {
            Text("Words of today")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Spacer()

            VStack {
                Text(viewModel.wordList[currentIndex].word)
                    .font(.system(size: 36, weight: .bold))
                    .padding()

                Text(viewModel.wordList[currentIndex].definition)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.2)))
            .padding()
            .animation(.spring(), value: currentIndex)

            Spacer()

            HStack(spacing: 30) {
                Button(action: {
                    withAnimation {
                        currentIndex = (currentIndex - 1 + viewModel.wordList.count) % viewModel.wordList.count
                    }
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                }

                Button(action: {
                    withAnimation {
                        currentIndex = (currentIndex + 1) % viewModel.wordList.count
                    }
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)

                }
            }
            .padding(.bottom, 30)
        }.navigationBarBackButtonHidden(true) // Hide back button
            .background(Color("bg-color"))

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: OnboardingViewModel())
    }
}
