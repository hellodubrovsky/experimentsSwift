//
//  ViewController.swift
//  UIView-Basics-Project
//
//  Created by Илья on 08.12.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bundle - Представление кода и ресурсов, хранящихся в каталоге пакетов на диске. Файл архива, который после компиляции включает все ресуры нашего таргета. A representation of the code and resources stored in a bundle directory on disk.
        // main - Возвращает объект пакета, содержащий текущий исполняемый файл. указывает на то, какой Bundle мы выбираем, в данном случае главный.
        // loadNibView - Разархивирует содержимое файла nib, расположенного в пакете получателя. Unarchives the contents of a nib file located in the receiver's bundle.
        // name - название бандла. Имя файла наконечника, которое не обязательно должно включать расширение .nib.
        // owner - можно указать другой таргет. Объект, назначаемый в качестве объекта владельца файла наконечника.
        // optional - Словарь, содержащий параметры, которые следует использовать при открытии файла nib. Список доступных ключей для этого словаря см. в разделе Параметры загрузки пера UIKit.
        // Nib и Xib это HTML-файлы.

        
        if let blueView = Bundle.main.loadNibNamed("ExampleView", owner: nil, options: nil)?.first as? UIView {
            blueView.frame = CGRect(x: 100, y: 200, width: 200, height: 100)
            
            // Добавление скругления
            blueView.layer.cornerRadius = 20.0
            
            // Добавление тени
            blueView.layer.shadowOffset = CGSize(width: 10, height: 10)
            blueView.layer.shadowOpacity = 0.3
            blueView.layer.shadowRadius = 5.0
            blueView.layer.shadowColor = UIColor.systemRed.cgColor
            
            // Добавление обводки
            blueView.layer.borderColor = UIColor.systemYellow.cgColor
            blueView.layer.borderWidth = 2
            
            // clipsToBounds - обрезает то, что выходит за frame, если будет true, то обрежется тень, которая находиться за пределами.
            blueView.clipsToBounds = false
            
            // Добавление изображения
            blueView.layer.contents = UIImage(named: "cat")?.cgImage
            blueView.layer.contentsGravity = .resizeAspect
            blueView.layer.masksToBounds = false
            
            // Отличие UIView от CALayer --> layer не умеют обрабатывать нажатия.
            view.addSubview(blueView)
        }
    }
}
