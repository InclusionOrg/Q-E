//
//  empathy.swift
//  Applied_Empathy
//
//  Created by Simone Grant on 6/9/18.
//  Copyright © 2018 Simone Grant. All rights reserved.
//

import Foundation

struct Empathy: Codable {
    let title: String
    let year: Int
    let author: String
    let whyEmpathy: [String]
    let unlockingEmpathy: [String]
    let archetypes: Archetypes
    let categories: Categories
}

struct Archetypes: Codable {
    let sage: [String]
    let inquirer: [String]
    let convener: [String]
    let alchemist: [String]
    let confidant: [String]
    let seeker: [String]
    let cultivator: [String]
}

struct Categories: Codable {
    let cultivatorCards: [String]
    let cultivatorDesc: [String]
    let sageCards: [String]
    let sageDesc: [String]
    let inquirerCards: [String]
    let inquirerDesc: [String]
    let convenerCards: [String]
    let convenerDesc: [String]
    let alchemistCards: [String]
    let alchemistDesc: [String]
    let confidantCards: [String]
    let confidantDesc: [String]
    let seekerCards: [String]
    let seekerDesc: [String]
    
}


