//
//  SettingsOption.swift
//  SettingsApp
//
//  Created by Мария Солодова on 13.08.2022.
//
import UIKit
import Foundation



enum SettingsOptionType {
    case staticCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackground: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackground: UIColor
    let handler: (() -> Void)
   
}
