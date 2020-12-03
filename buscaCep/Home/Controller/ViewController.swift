//
//  ViewController.swift
//  buscaCep
//
//  Created by Usemobile Tecnologia on 03/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var buscarButton: UIButton!
    @IBOutlet weak var CEPTextField: UITextField!
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Funcoes
    
    func limpaTextField() {
        CEPTextField.text = ""
    }
    
    func travaDestravaButton() {
        if buscarButton.isUserInteractionEnabled {
            buscarButton.isUserInteractionEnabled = false
        } else {
            buscarButton.isUserInteractionEnabled = true
        }
    }
    
    func verificaSeCepEValido(_ cep: String) -> Bool {
        if cep.isEmpty {
            return false
        }
        
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(cep).isSubset(of: nums)
    }
    // MARK: - IBActions
    
    @IBAction func buscaEnderecoViaCEP(_ sender: UIButton) {
        guard let cep = CEPTextField.text else {return} // tratar campo de CEP antes
        if verificaSeCepEValido(cep) {
            travaDestravaButton()
            BuscaCepAPI().buscaEnderecoViaCEP(para: cep) { (endereco: Endereco) in
                DispatchQueue.main.async {
                    self.limpaTextField()
                    self.travaDestravaButton()
                    let enderecoView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "endereco") as! EnderecoViewController
                    enderecoView.endereco = endereco
                    self.navigationController?.pushViewController(enderecoView, animated: true)
                }
            } falha: { (erro) in
                DispatchQueue.main.async {
                    self.travaDestravaButton()
                }
                print(erro)
            }
        }

    }
    

}

