import UIKit

class HeroesCell: UITableViewCell {
    private let horizontalStack: UIStackView = {
        let stack = UIStackView ()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    private let herovillainImageView: UIImageView = {
      let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .purple
        return imageView
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView ()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let nameLebel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let empresaLebel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        addViewsInHierarchy()
        setupConstraints()
        
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    public func setup(herovillain:HeroesVillains){
        nameLebel.text = herovillain.name
        empresaLebel.text = herovillain.biography.fullName
        herovillainImageView.download(from: herovillain.image.url)
    }
    
    private func setupView () {
        selectionStyle = .none
    }
    
    private func addViewsInHierarchy() {
        contentView.addSubview(horizontalStack)
        horizontalStack.addArrangedSubview(herovillainImageView)
        horizontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(nameLebel)
        verticalStack.addArrangedSubview(empresaLebel)
        verticalStack.addArrangedSubview(UIView())
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            herovillainImageView.widthAnchor.constraint(equalToConstant: 90),
            herovillainImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
