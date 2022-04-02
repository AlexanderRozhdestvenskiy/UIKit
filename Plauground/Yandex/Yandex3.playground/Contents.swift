import UIKit

// UIView

/*
 - Что такое UIView
 
 - View Hierarchy
 
 - Верстка
 
 - Отрисовка
 
 - Обработка событий
 
 - Подклассы UIView
 
 - Apperance
 
 - Немного анимации
 */

// 1) Что такое UIView - представление на экране, прямоугольник с заданными координатами и размерами, а также цветом

class mainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

/*
 Задачи UIView:
    1. Иерархия
    2. Верстка
    3. Отрисовка
    4. Обработка событий
 */

// 2) View Hierarchy. Иерархия View.

func addSubview(_ view: UIView) {
    // добавление view в иерархию (поверх остальных View)
}

// 3) Верстка

/*
 CGRect(origin: CGPoint, size: CGSize) - структура определяет расположение и размеры прямоугольника
 
 origin - CGPoint(x, y)
 size - CGSize(width, height)
 
 */

let rect: CGRect = CGRect(origin: CGPoint(x: 200, y: 200), size: CGSize(width: 200, height: 200))

// frame - положение относительно супервью
// bounds - координаты вью в ее собственной системе

// Auto Layout - система линейных неравенств

/*
 Hugging priority - насколько вьюшка готова растягиваться, растянется та, у которой ниже приоритет
 
 Compression resistance - насколько вьюшка готова сжиматься, сожмется та, у которой ниже приоритет
 */

// 4) Отрисовка

let ex = CALayer()

// 5) Обработка событий

let responder = UIResponder() // класс, обрабатывающий события
let application = UIApplication() // сначала событие прилетает в этот класс
let gesture = UIGestureRecognizer() // класс для обработки жестов
