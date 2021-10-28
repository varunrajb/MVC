//
//  ListTableCell.swift
//  MVVM
//
//  Created by Raji Mac Mini on 28/10/21.
//

import UIKit
import Foundation


enum CheckBoxImageType: String {
    case unchecked = "unchecked"
    case checked = "checked"
}

struct FacilityList {
    let title: String
    let id: Int
    let selectedOptionId: Int
    
    var options = [Option]()
    
    init(title: String, id: Int, items: [FacilityOption], selectedOptionId: Int) {
        self.title = title
        self.id = id
        self.selectedOptionId = selectedOptionId
        prepare(items: items)
    }
    
    init(title: String, id: Int, options: [Option], selectedOptionId: Int) {
        self.title = title
        self.id = id
        self.selectedOptionId = selectedOptionId
        prepareOther(options: options)
    }
    

    mutating func prepare(items: [FacilityOption]) {
        for item in items {
            let optionModel =  Option(optionsImage:item.iconName , optionsTitle: item.name, optionsStatusImage: CheckBoxImageType.unchecked.rawValue, optionId: item.optionId)
            options.append(optionModel)
        }
    }
    
    mutating func prepareOther(options: [Option]) {
        for option in options {
            var selectedImage = CheckBoxImageType.unchecked.rawValue
            if (option.optionId == self.selectedOptionId) {
                selectedImage = CheckBoxImageType.checked.rawValue
            }
            let optionModel = Option(optionsImage:option.optionsImage , optionsTitle: option.optionsTitle, optionsStatusImage: selectedImage, optionId: option.optionId)
            self.options.append(optionModel)
        }
    }
    
}


