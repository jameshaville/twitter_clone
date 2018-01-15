import UIKit

class HomeController: UIViewController {

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let homeDataSource = HomeDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeDataSource.setup(collectionView: collectionView)
        setupViews()
    }

    private func setupViews() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

let twitterBlue = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)

final class UserCell: UICollectionViewCell {


    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "pass_pic")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "James Haville"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@jameshaville"
        label.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "iOS Development Tutorials. All things Swift. Join my YouTube channel for more information and to get in touch with me."
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear
        return textView
    }()

    let followButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = twitterBlue.cgColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.tintColor = twitterBlue
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(bioTextView)
        contentView.addSubview(followButton)
        contentView.addSubview(separatorView)

        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true

        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: followButton.leftAnchor, constant: -12).isActive = true

        usernameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true

        bioTextView.leadingAnchor.constraint(equalTo: usernameLabel.leadingAnchor).isActive = true
        bioTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bioTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        bioTextView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor).isActive = true

        followButton.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        followButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        followButton.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 12).isActive = true
        followButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        followButton.heightAnchor.constraint(equalToConstant: 34).isActive = true

        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func update(with user: User) {
        nameLabel.text = user.name
        usernameLabel.text = user.username
        bioTextView.text = user.bioText
        profileImageView.image = user.profileImage
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
