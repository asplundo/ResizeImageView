import UIKit

class ImageTableViewCell: UITableViewCell {
    
    static let identifier = "imageTableViewCell"
    static let previewImageViewSize = CGSize(width: 250, height: 250)
    
    let previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testar sig lite"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsAndLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViewsAndLayout() {
        addImageViewAndLayout()
        addTextViewAndLayout()
    }
    
    private func addImageViewAndLayout() {
        contentView.addSubview(previewImageView)
        let widthAnchor = previewImageView.widthAnchor.constraint(lessThanOrEqualToConstant: ImageTableViewCell.previewImageViewSize.width)
        let heightAnchor = previewImageView.heightAnchor.constraint(lessThanOrEqualToConstant: ImageTableViewCell.previewImageViewSize.height)
        let topAnchor = previewImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        NSLayoutConstraint.activate([widthAnchor, heightAnchor, topAnchor])
    }
    
    private func addTextViewAndLayout() {
        contentView.addSubview(testLabel)
        let labelLeadingAnchor = testLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        let labelTrailingAnchor = testLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        let labelTopAnchor = testLabel.topAnchor.constraint(equalTo: previewImageView.bottomAnchor)
        let labelBottomAnchor = testLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        
        NSLayoutConstraint.activate([labelLeadingAnchor, labelTrailingAnchor, labelTopAnchor, labelBottomAnchor])
    }
        
    func configure(with image: UIImage?) {
        guard let loadedImage = image else { return }
        previewImageView.image = loadedImage.resize(withSize: ImageTableViewCell.previewImageViewSize, contentMode: .contentAspectFit)
    }
    
    
}
