//
//  ArticleTableViewCell.swift
//  SkeletonView-tests
//
//  Created by Raúl Pascual de la Calle on 19/9/21.
//

import UIKit
import SkeletonView

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    func setupSkeleton(){
        articleTitle.isSkeletonable = true
        articleContent.isSkeletonable = true
        articleImage.isSkeletonable = true
        
    }
    
    func setupUI(){
        articleTitle.text = ""
        articleContent.text = ""
    }
    
}
