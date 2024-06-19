//
//  PhoneticsListView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 10/04/01/2024.
//

import SwiftUI

struct PhoneticsListView: View {
    var title: String
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 5), count: 5)
    var phonetics: PhoneticsListModel
    
    @State private var showDetailView = false
    @State private var phoneticModel = PhoneticModel(id: 0, word: "Default", description: "Default", explanation: "default", example: [])
    @State private var phoneticIndex = 0
    @State private var buttonText = "Next"
    @State private var isFirstItem = false
    @State private var isFinish = false
    
    var body: some View {

        VStack(spacing: 15) {
            
//            NavigationLink(destination: 
//                            PhoneticsDetailview(
//                            phonetic: $phoneticModel,
//                            buttonText: $buttonText,
//                            isFirstItem: $isFirstItem,
//                            isFinish: $isFinish,
//                            onIncrementIndex: incrementIndex,
//                            onDecrementIndex: decrementIndex
//                        ), isActive: $showDetailView) {
//                            EmptyView()
//                        }
//            
//            
            
            // MARK: - TITLE
            Text(title)
                .font(AppFont.subtitle)
                .foregroundColor(whiteColor)
                .frame(maxWidth: .infinity)
                .frame(height: 45)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(phoneticsTextColor)
                )
                .padding(.top, 20)
            
            // MARK: - PHONETICS LIST
            LazyVGrid(columns: columns) {
                ForEach(Array(phonetics.phoneticsList.enumerated()), id: \.1.id) { (index, item) in
                    
                    Text(item.word)
                        .font(AppFont.title2)
                        .foregroundStyle(phoneticsTextColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(phoneticsColor)
                        )
                        .onTapGesture {
                            handleItemTap(index)
                        }
                    
                }//: LOOP
            }//: GRID
            
        }//: VSTACK
        .navigationDestination(isPresented: $showDetailView) {
            PhoneticsDetailview(
            phonetic: $phoneticModel,
            buttonText: $buttonText,
            isFirstItem: $isFirstItem,
            isFinish: $isFinish,
            onIncrementIndex: incrementIndex,
            onDecrementIndex: decrementIndex)
        }
    }
    
    // MARK: - TAP GESTURE
    private func handleItemTap(_ index: Int) {
        phoneticModel = phonetics.phoneticsList[index]
        
        phoneticIndex = index
        
        if phonetics.phoneticsList.count - 1 == phoneticIndex {
            buttonText = "Finish"
        } else {
            buttonText = "Next"
            isFirstItem = phoneticIndex == 0
        }
        
        showDetailView = true
    }
    
    // MARK: - INCREASE INDEX FROM DETAIL VIEW
    private func incrementIndex() {
        phoneticIndex += 1
        
        if phonetics.phoneticsList.count - 1 < phoneticIndex {
            isFinish = true
        }
        
        if phonetics.phoneticsList.count - 1 >= phoneticIndex {
            phoneticModel = phonetics.phoneticsList[phoneticIndex]
            buttonText = "Next"
            isFinish = false
            isFirstItem = phoneticIndex == 0
            
            if phonetics.phoneticsList.count - 1 == phoneticIndex {
                buttonText = "Finish"
            }
        }
    }
    
    // MARK: - DECREASE INDEX FROM DETAIL VIEW
    private func decrementIndex() {
        phoneticIndex -= 1
        
        if phoneticIndex >= 0 {
            phoneticModel = phonetics.phoneticsList[phoneticIndex]
            isFirstItem = false
        } else {
            phoneticIndex = 0
            isFirstItem = true
        }
    }
}


#Preview {
    PhoneticsListView(title: "Vowels", phonetics: vowelPhoneticLists)
    
}
