//
//  ThemeManager.swift
//  TrendingProjects
//
//  Created by Mikalai Bekliamishchau on 17/03/2025.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    @Published var currentTheme: ColorScheme? = nil
    
    init() {
        currentTheme = isDarkMode ? .dark : .light
    }
    
    func toggleTheme() {
        isDarkMode.toggle()
        currentTheme = isDarkMode ? .dark : .light
    }
    
    func backgroundColor() -> Color {
        return isDarkMode ? Color.black : Color.white
    }
    
    func textColor() -> Color {
        return isDarkMode ? Color.white : Color.black
    }
    
    func secondaryTextColor() -> Color {
        return isDarkMode ? Color.gray : Color.black.opacity(0.7)
    }
    
    func cardBackgroundColor() -> Color {
        return isDarkMode ? Color.gray.opacity(0.2) : Color.white
    }
    
    func shadowColor() -> Color {
        return isDarkMode ? Color.clear : Color.black.opacity(0.2)
    }
}
