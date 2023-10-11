//
//  ListViewController.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel = ListViewModel()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        registerXIB()
        
    }
    
    func registerXIB() {
        displayUsername()
        let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell")
        fetchUsers()
    }
    
    func displayUsername() {
        if let username = viewModel.retrieveUsername() {
               self.title = username
           } else {
               self.title = "User not found"
           }
       }
    
    func fetchUsers() {
        viewModel.fetchPokemonData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

    // MARK: - extension Table View DataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        let pokemonName = viewModel.pokemons[indexPath.row]
        cell.configure(withName: pokemonName)
        return cell
    }
}
