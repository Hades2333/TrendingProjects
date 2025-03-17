//
//  SpinnerView.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 16/03/2025.
//

import SwiftUI

struct SpinnerView: View {
    @State private var showSpinner: Bool = false
    @State private var degree: Double = 270
    @State private var spinnerLength: CGFloat = 0.6
    
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .trim(from: 0.0, to: spinnerLength)
                    .stroke(
                        LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing),
                        style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round)
                    )
                    .frame(width: 60, height: 60)
                    .rotationEffect(Angle(degrees: degree))
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5).repeatForever(autoreverses: true)) {
                            spinnerLength = 0
                        }
                        
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                            degree = 270 + 360
                        }
                    }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
