//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by Ahmed Halilovic on 25. 8. 2024..
//

import UIKit

class NewsTableViewCellViewModel {
    let title: String
    let subtitles: String
    let imageURL: URL?
    let imageData: Data? = nil
    
    init(title: String, subtitles: String, imageURL: URL?) {
        self.title = title
        self.subtitles = subtitles
        self.imageURL = imageURL
    }
}

class NewsTableViewCell: UITableViewCell {
    static let identifier = "NewsTableViewCell"
    
    // Creates and configures a label for displaying a title.
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    
    // Creates and configures a label for displaying a subtitle.
    private let newsSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    // Creates and configures an image view with a red background and scale-to-fill content mode.
    private let newsImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(newsSubtitleLabel)
        contentView.addSubview(newsImageView)
    }
    
    // Initializes the cell when loaded from a storyboard or xib.
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Adjusts the layout of the cell’s subviews.
    override func layoutSubviews() {
        super.layoutSubviews()
        
        newsTitleLabel.frame = CGRect(x: 10,
                                      y: 0,
                                      width: contentView.frame.size.width - 120,
                                      height: contentView.frame.size.height/2)
    }
    
    // Resets the cell's properties before it is reused.
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: NewsTableViewCellViewModel) {
        newsTitleLabel.text = viewModel.title
        newsSubtitleLabel.text = viewModel.subtitles

        // Image
        if let data = viewModel.imageData {
            newsImageView.image = UIImage(data: data)
        } else {
            //fetch
        }
    }

}
