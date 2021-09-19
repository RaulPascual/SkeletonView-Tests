//
//  ArticleTableViewCell.swift
//  SkeletonView-tests
//
//  Created by Raúl Pascual de la Calle on 19/9/21.
//

import UIKit
import SkeletonView

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitle: UILabel?
    @IBOutlet weak var articleImage: UIImageView?
    @IBOutlet weak var articleContent: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupSkeleton()
        loadCellData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // Mark the components as Skeletonizable to be able to add the animation on them.
    func setupSkeleton(){
        articleTitle?.isSkeletonable = true
        articleContent?.isSkeletonable = true
        articleImage?.isSkeletonable = true
        
    }
    
    func setupUI(){
        articleTitle?.text = ""
        articleContent?.text = ""
    }
    
    func loadCellData(){
        
        // Show animation
        articleImage?.showGradientSkeleton(usingGradient: .init(baseColor: .systemBlue), transition: .crossDissolve(0.5))
        articleTitle?.showAnimatedGradientSkeleton()
        articleContent?.showAnimatedGradientSkeleton()
        
        // Add content to cell
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.articleImage?.image = UIImage(named: "snow")
            self.articleTitle?.text = "Article title"
            self.articleContent?.text = "This has been an example of SkeletonView animations to put on the components when loading data"
        }
        
        //Hide animation after 8 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 8){
            self.articleImage?.hideSkeleton()
            self.articleTitle?.hideSkeleton()
            self.articleContent?.hideSkeleton()
        }
        
    }
    
}
