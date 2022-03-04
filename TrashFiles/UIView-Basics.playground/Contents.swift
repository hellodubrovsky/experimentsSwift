import UIKit
import PlaygroundSupport    // Позволяет отображать liveView в playground файле.

// MARK: SuperView -> mainView
let mainViewRect = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
let mainView = UIView(frame: mainViewRect)

// MARK: SubView -> secondaryView
let secondaryViewRect = CGRect(origin: CGPoint(x: 15.0, y: 15.0), size: CGSize(width: 100, height: 150))
let secondaryView = UIView(frame: secondaryViewRect)

mainView.backgroundColor = .systemGreen
secondaryView.backgroundColor = .systemYellow

// secondaryView, мы вкладываем внутрь view-родителя.
mainView.addSubview(secondaryView)
PlaygroundPage.current.liveView = mainView

// Проверим вложенность.
print("Super view is \(String(describing: secondaryView.superview)).")
print("Subviews are \(mainView.subviews).")
