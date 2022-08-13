//
//  ViewController.swift
//  SettingsApp
//
//  Created by Мария Солодова on 13.08.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: - TableView Initialization

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(SettingsTableViewCell.self,
                       forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.register(SwitchTableViewCell.self,
                       forCellReuseIdentifier: SwitchTableViewCell.identifier)
        
        
        return table
    }()
    
    var models = [Section]()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.bounds
        
    }
    
    
        // MARK: - Methods for models
    
    func configure() {
        
        models.append(Section(title: "General", options: [
        
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackground: .systemOrange, handler: {
                print("Tapped Airplane Mode cell")
            }, isOn: true)),
        
        
        ]))
        self.models.append(Section(title: "General", options: [
            
            .staticCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackground: .systemBlue) {
                print("Tapped Wi-Fi cell")
                
            }),
            
                .staticCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(named: "bluetooth"), iconBackground: .systemBlue) {
                    
                    print("Tapped bluetooth cell")
            }),
            
                .staticCell(model: SettingsOption(title: "Cellular", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackground: .systemGreen) {
                    
                    print("Tapped Cellular cell")
                
            }),
            
                .staticCell(model:SettingsOption(title: "Personal Hotspot", icon: UIImage(systemName: "personalhotspot"), iconBackground: .systemGreen) {
                    
                    print("Tapped Personal Hotspot cell")
            }),
            
                .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named: "vpn"), iconBackground: .systemBlue, handler: {
                    
                    print("Tapped VPN cell")
                }, isOn: true)),
            
            
            ]))
            
    
        
        self.models.append(Section(title: "Information", options: [
            .staticCell(model: SettingsOption(title: "Notifications", icon: UIImage(systemName:"note"), iconBackground: .systemRed) {
                print("Tapped Information cell")
                
            }),
            
                .staticCell(model: SettingsOption(title: "Sounds & Haptics", icon: UIImage(systemName: "volume.3"), iconBackground: .systemPink) {
                    
                    print("Tapped Sounds & Haptics cell")
                
            }),
            
                .staticCell(model: SettingsOption(title: "Do Not Disturb", icon: UIImage(systemName: "moon"), iconBackground: .systemIndigo) {
                    
                    print("Tapped Do Not Disturb cell")
                
            }),
            
                .staticCell(model:SettingsOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), iconBackground: .systemIndigo) {
                    
                    print("Tapped Screen Time cell")
                
            })
            
            
        ]))
        
        
        self.models.append(Section(title: "Apps", options: [
            .staticCell(model: SettingsOption(title: "General", icon: UIImage(systemName: "gear"), iconBackground: .systemGray) {
                print("Tapped General cell")
                
            }),
            
                .staticCell(model: SettingsOption(title: "Control Center", icon: UIImage(systemName: "switch.2"), iconBackground: .systemGray) {
                    
                    print("Tapped Control Center cell")
                
            }),
            
                .staticCell(model: SettingsOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), iconBackground: .systemBlue) {
                    
                    print("Tapped Display & Brightness cell")
                
            }),
            
                .staticCell(model:SettingsOption(title: "Home Screen", icon: UIImage(systemName: "apps.iphone"), iconBackground: .systemBlue) {
                    
                    print("Tapped Home Screen cell")
                
            }),
            
                .staticCell(model:SettingsOption(title: "Accessibility", icon: UIImage(systemName: "person.circle"), iconBackground: .systemBlue) {
                    
                    print("Tapped Accessibility cell")
                
            })

            
        ]))
            
      
    }
    
    
    // MARK: - Methods for tableView
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
            
        case.switchCell(let model):
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
            
        }
        
    }
                                                
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        
        switch type.self {
        case .staticCell(let model):
            model.handler()
            
        case.switchCell(let model):
            model.handler()
    }


}

}
