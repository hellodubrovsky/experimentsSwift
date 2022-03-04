//
//  ExapleView.swift
//  UIView-Basics-Project
//
//  Created by Илья on 08.12.2021.
//

import UIKit

class ExapleView: UIView {
    
    // Coder - объект, помогает загрузить XML из файла XIB.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // (Синтаксис CoreGraphics), метод draw() дорогая операция, т.к. рисуем на CPU.
    /*
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        let recrangle = CGRect(x: 10, y: 10, width: 50, height: 50)
        context.stroke(recrangle)
    }
    */
    
    // let button = UIButton(type: .system)
    // button.addTarget(Any, action: Selector)
}
