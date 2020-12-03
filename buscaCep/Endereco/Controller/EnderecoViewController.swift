//
//  EnderecoViewController.swift
//  buscaCep
//
//  Created by Usemobile Tecnologia on 03/12/20.
//

import UIKit

class EnderecoViewController: UIViewController {

    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    
    // MARK: - Variables
    
    var endereco: Endereco?
    
    // MARK: - LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preencheCampos()
    }
    
    // MARK: - Funcoes
    
    func preencheCampos() {
        guard let endereco = endereco else {return}
        enderecoTextField.text = endereco.endereco
        bairroTextField.text = endereco.bairro
        cidadeTextField.text = endereco.cidade
        estadoTextField.text = endereco.estado
    }
    
}
