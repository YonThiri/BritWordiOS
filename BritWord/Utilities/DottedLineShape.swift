//
//  DottedLineShape.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 11/01/2024.
//

import SwiftUI

<<<<<<< HEAD
struct DottedLineShape: Shape {
    
    let stratPoint: Alignment
        let endPoint: Alignment
        
        init(stratPoint: Alignment, endPoint: Alignment) {
            self.stratPoint = stratPoint
            self.endPoint = endPoint
        }
        
        private func cgPointTranslator(alignment: Alignment, rect: CGRect) -> CGPoint {
            
            switch alignment {
            case .topLeading: return CGPoint(x: rect.minX, y: rect.minY)
            case .top: return CGPoint(x: rect.midX, y: rect.minY)
            case .topTrailing: return CGPoint(x: rect.maxX, y: rect.minY)
                
            case .leading: return CGPoint(x: rect.minX, y: rect.midY)
            case .center: return CGPoint(x: rect.midX, y: rect.midY)
            case .trailing: return CGPoint(x: rect.maxX, y: rect.midY)
                
            case .bottomLeading: return CGPoint(x: rect.minX, y: rect.maxY)
            case .bottom: return CGPoint(x: rect.midX, y: rect.maxY)
            case .bottomTrailing: return CGPoint(x: rect.maxX, y: rect.maxY)
            default: return CGPoint(x: rect.minX, y: rect.minY)
            }
            
        }

        func path(in rect: CGRect) -> Path {
            
            Path { path in
                
                path.move(to: cgPointTranslator(alignment: stratPoint, rect: rect))
                path.addLine(to: cgPointTranslator(alignment: endPoint, rect: rect))
                
            }
            
        }
=======
struct DottedLineShape: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DottedLineShape()
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
}
