//
//  ViewController.swift
//  MyHeroApp
//
//  Created by Falih Naufal on 21/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Menambahkan title pada Navigation
        self.navigationItem.title = "Pahlawan Indonesia"
        
        // Menghubungkan heroTableView dengan ke dua metode di bawah
        heroTableView.dataSource = self
        
        // Menambahkan delegate ke table view
        heroTableView.delegate = self
        
        // Menghubungkan berkas XIB untuk HeroTableViewCell dengn heroTableView.
        heroTableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Digunakan untuh menghubungkan cell dengan identifier "HeroCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell", for: indexPath) as? HeroTableViewCell {
            
            // Menetapkan nilai hero ke view di dalam cell
            let hero = heroes[indexPath.row]
            cell.nameHero.text = hero.name
            cell.descHero.text = hero.description
            cell.photoHero.image = hero.photo
            
            // Kode ini digunakan untuk membuat imageView memiliki frame bound/lingkaran
            cell.photoHero.layer.cornerRadius = cell.photoHero.frame.height / 2
            cell.photoHero.clipsToBounds = true
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Memanggil View Controller dengan berkas NIB/XIB di dalamnya
        let detail = DetailewController(nibName: "DetailewController", bundle: nil)
        
        // Mengirim data hero
        detail.hero = heroes[indexPath.row]
        
        // Push/mendorong view controller lain
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
