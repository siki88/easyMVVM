//
//  RootViewController.swift
//  EasyMVVM
//
//  Created by Alex Nagy on 09/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
//    Pozorovatelé majetku sledují změny hodnoty nemovitosti a reagují na ně. Pozorovatelé vlastností jsou voláni pokaždé, když je nastavena hodnota vlastnosti, i když nová hodnota je stejná jako aktuální hodnota vlastnosti .
    var viewModel: RootViewModel! {
        didSet{
            view.backgroundColor = viewModel.user.backgroundColor
            navigationItem.title = "\(viewModel.user.name), \(viewModel.user.age)"
        }
    }
    
//     Tyto proměnné jsou vytvářeny pomocí funkce, kterou určíte, pouze když je tato proměnná poprvé požadována. Pokud to není nikdy požadováno, funkce se nikdy nespustí, takže pomáhá šetřit čas zpracování. Líná uložená vlastnost je vlastnost, jejíž počáteční hodnota není vypočítána až při prvním použití. Povězením označíte línou uloženou vlastnostlazy modifikátor před jeho deklarací.
//    lazy var iOSResumeDescription: String = {
//        return "I am an iOS developer"
//    }()
    
//    Proměnné můžete odkazovat bez ohledu na to, zda použijete uzávěrku.
//    lazy var iOSResumeDescription = “I am an iOS developer”
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Tap to fetch to receive the message"
        return label
    }()

    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .gray)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupNavigation()
        setupViews()
        
//        let user = User(name: "SIKI", age: 31, backgroundColor: UIColor(red: 0/255, green: 206/255, blue: 24/255, alpha: 1.0))
//        viewModel = RootViewModel(user: user)
        
        viewModel.rootViewModelDelegate = self
    }
    
    
//    Deklarovaná entita je fileprivatepřístupná pouze ze souboru, ve kterém je definována.
//    Jinými slovy, entita, která je deklarována, privateje přístupná z libovolných rozšíření tohoto typu ve stejném zdrojovém souboru.
//    Jinými slovy, privateklíčové slovo zůstává přísnější než fileprivateklíčové slovo.
    
    fileprivate func setupNavigation(){
        navigationItem.title = "RootViewController"
        
        let resetBarButtonIten = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonTapped))
        let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(fetchBarButtonItemTapped))
        
        navigationItem.setLeftBarButton(resetBarButtonIten, animated: false)
        navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
    }
    
    @objc fileprivate func resetBarButtonTapped(){
        label.text = "tap FETCH to retreive the message"
        print("click reset")
        
        
//        hlavní vlákno
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { timer in
                print("go to fire 5 second")
            })
        }
//
//        DispatchQueue.main.async { [weak self] in
//            Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false, block: { timer in
//                print("go to fire 2")
//            })
//        }
//
//        volá jako poslední
//        defer {
//            Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false, block: { timer in
//                print("go to fire 3")
//            })
//        }
        
        
        print("hello world")
    }
    
    
    
    
    @objc fileprivate func fetchBarButtonItemTapped(){
        
        print("click fetch")

//        MARK: calling fetchMessage func on RootViewModel
        viewModel.fetchMessage()
        
//        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fire), userInfo: nil, repeats: false)

//        DispatchQueueHelper.delay(bySeconds: 3.0, dispatchLevel: .background){
//        }
        
    }
    
//        @objc fileprivate func fire(){
//            print("go to fire func")
//            self.label.text = "MY EXAMPLE CODE"
//            self.activityIndicator.stopAnimating()
//        }
    
    fileprivate func setupViews(){
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(activityIndicator)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.center.y = view.center.y + 30
        activityIndicator.center.x = view.center.x
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        print("setupViews")
    }


}

extension RootViewController: RootViewModelDelegate {
    func didStartFetchingMessage(_ message: String?) {
        label.text = message
        activityIndicator.startAnimating()
    }
    
    func didFinishFetchingMessage(_ message: String?) {
        label.text = message
        activityIndicator.stopAnimating()
    }
    
}

