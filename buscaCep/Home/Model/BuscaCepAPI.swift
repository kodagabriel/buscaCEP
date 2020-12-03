//
//  BuscaCepAPI.swift
//  buscaCep
//
//  Created by Usemobile Tecnologia on 03/12/20.
//

import UIKit

enum errosNaBusca: Error {
    case cepNaoEncontrado
}

class BuscaCepAPI: NSObject {
    
    
    func buscaEnderecoViaCEP(para cep: String, sucesso:@escaping(_ endereco: Endereco) -> Void, falha:@escaping(_ error: Error) -> Void) {
        guard let url = URL(string: "http://viacep.com.br/ws/\(cep)/json") else {return}
        
        var requisicao = URLRequest(url: url)
        requisicao.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: requisicao) { (data, response, error) in
            if error == nil {
                do {
                    guard let d = data else {return}
                    let data = try JSONSerialization.jsonObject(with: d, options: []) as? [String: String]
                    if data != nil {
                        guard let cep = data?["cep"], let rua = data?["logradouro"], let bairro = data?["bairro"], let cidade = data?["localidade"], let estado = data?["uf"] else {
                                return
                            }
                        let end = Endereco(CEP: cep, endereco: rua, bairro: bairro, cidade: cidade, estado: estado)
                        sucesso(end)
                    } else {
                        falha(errosNaBusca.cepNaoEncontrado)
                    }
                    
                } catch {
                    falha(errosNaBusca.cepNaoEncontrado)
                }
                
            }
        }
        task.resume()
        
    }
}
