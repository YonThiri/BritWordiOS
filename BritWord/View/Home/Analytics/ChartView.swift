//
//  ChartView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 26/05/2024.
//

import SwiftUI


enum Segment: String, CaseIterable, Identifiable {
    case day = "Day"
    case week = "Week"
    case year = "Year"
    
    var id: String { self.rawValue }
}

struct ChartView: View {
    
    @State private var selectedSegment: Segment = .day

    init() {
            
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(.white))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color(.black))], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    var body: some View {
        
        ZStack {
            backgroundColor
            
            VStack {
                
                NavigationHeaderView()
                
                VStack(spacing: 25) {
                    Picker("Select a segment", selection: $selectedSegment) {
                        ForEach(Segment.allCases) { segment in
                            Text(segment.rawValue).tag(segment)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    ZStack {
                        Image(.chartBg)
                            .resizable()
                        
                        HStack {
                            Text("Total Play Time")
                                .font(AppFont.body2).bold()
                                .foregroundStyle(whiteColor)
                            
                            Spacer()
                            
                            HStack {
                                Text("109")
                                    .font(AppFont.title).bold()
                                    .foregroundStyle(whiteColor)
                                
                                Text("s")
                                    .font(AppFont.body2).bold()
                                    .foregroundStyle(grayColor)
                            }
                            
                        }
                        .padding()
                    }
                    .frame(height: 150)
                    
                }
                .padding()
                
                Spacer()
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        
        
        
    }
}

#Preview {
    ChartView()
}
