//
//  HomeViewController.swift
//  SkeletonView-tests
//
//  Created by Raúl Pascual de la Calle on 17/9/21.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var newspaperNameLabel: UILabel!
    @IBOutlet weak var newsPaperLogoImage: UIImageView!
    @IBOutlet weak var ArticlesTableView: UITableView!
    @IBOutlet weak var loadDataButton: UIButton!
    @IBAction func loadData(_ sender: Any) {
        loadSampleData()
    }
    
    //MARK: - Variables
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ArticlesTableView.delegate = self
        ArticlesTableView.dataSource = self
        self.ArticlesTableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        newspaperNameLabel.text = ""
        setupSkeleton()
    }
    
   

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
    
    func setupSkeleton(){
        self.newsPaperLogoImage.isSkeletonable = true
        self.newspaperNameLabel.isSkeletonable = true
    }
    
    func loadSampleData(){
        
        newspaperNameLabel.showAnimatedGradientSkeleton()
        newsPaperLogoImage.showAnimatedGradientSkeleton()
        
       DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.newspaperNameLabel.text = "Last hour notices"
            self.newsPaperLogoImage.image = UIImage(named: "newsHeader")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
            self.newspaperNameLabel.hideSkeleton()
            self.newsPaperLogoImage.hideSkeleton()
        }
        
    }
    
   
    
    
    
}
