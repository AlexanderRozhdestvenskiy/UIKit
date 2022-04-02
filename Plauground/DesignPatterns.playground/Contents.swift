import UIKit

// Порождающие - Одиночка, Фабричный метод, Абстрактная фабрика

// Структурные - Адаптер, Фасад, Декоратор

// Поведенческие - Делегат, Наблюдатель,


// Singleton

final class SetupView {
    
    static let shared = SetupView()
    
    private init() {
        
    }
}
