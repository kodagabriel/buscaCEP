//
//  Endereco.swift
//  buscaCep
//
//  Created by Usemobile Tecnologia on 03/12/20.
//

import UIKit

class Endereco: NSObject {
    let CEP: String
    let endereco: String
    let bairro: String
    let cidade: String
    let estado: String
    
    init(CEP: String, endereco: String, bairro: String, cidade: String, estado: String) {
        self.CEP = CEP
        self.endereco = endereco
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
    }
}
