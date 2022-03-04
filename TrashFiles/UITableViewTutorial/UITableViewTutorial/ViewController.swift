//
//  ViewController.swift
//  UITableViewTutorial
//
//  Created by Илья on 29.11.2021.
//

import UIKit

struct Section {
    let title: String
    let option: [DeveloperModeOptionType]
}

enum DeveloperModeOptionType {
    case staticCell(model: DeveloperModeOption)
    case switchCell(model: DeveloperModeSwitchOption)
}

struct DeveloperModeSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct DeveloperModeOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DeveloperModeTableViewCell.self, forCellReuseIdentifier: DeveloperModeTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Developer Mode"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure() {
        
        models.append(Section(title: "Логин", option: [
            .switchCell(model: DeveloperModeSwitchOption(title: "Бесшовность", icon: UIImage(systemName: "heart.fill"), iconBackgroundColor: .systemRed, handler: { }, isOn: false)),
        ]))
        
        models.append(Section(title: "Основное", option: [
            .staticCell(model: DeveloperModeOption(title: "Информация", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Авторизация", icon: UIImage(systemName: "bluetoth"), iconBackgroundColor: .systemBlue) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Логирование", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Дополнительно", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                print("Основное - Инф")
            }),
        ]))
        
        models.append(Section(title: "Второстепенное", option: [
            .staticCell(model: DeveloperModeOption(title: "Информация", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Авторизация", icon: UIImage(systemName: "bluetoth"), iconBackgroundColor: .systemBlue) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Логирование", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Дополнительно", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                print("Основное - Инф")
            }),
        ]))
        
        models.append(Section(title: "Мусор", option: [
            .staticCell(model: DeveloperModeOption(title: "Информация", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Авторизация", icon: UIImage(systemName: "bluetoth"), iconBackgroundColor: .systemBlue) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Логирование", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
                print("Основное - Инф")
            }),
            .staticCell(model: DeveloperModeOption(title: "Дополнительно", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
                print("Основное - Инф")
            }),
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DeveloperModeTableViewCell.identifier,
                for: indexPath
            ) as? DeveloperModeTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].option[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model):
            model.handler()
        }
    }
}

