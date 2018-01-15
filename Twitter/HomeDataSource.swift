import UIKit

class HomeDataSource: NSObject {
    let cellId = "cellId"
    let headerId = "headerId"
    let footerId = "footerId"

    let users: [User] = {
        let james = User(name: "James", username: "@jameshaville", bioText: "iOS Developer, subscribe to my channel on YouTube, contact me", profileImage: #imageLiteral(resourceName: "pass_pic"))
        let ray = User(name: "Ray", username: "@jameshaville", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference: http://www.rwdevcon.com ", profileImage:#imageLiteral(resourceName: "ray"))
        return [james, ray]
    }()

    private var collectionView: UICollectionView?

    func setup(collectionView: UICollectionView) {
        self.collectionView = collectionView
        collectionView.backgroundColor = .white
        collectionView.register(UserCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

final class FooterView: UICollectionReusableView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Show Me More"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterBlue
        return label
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .groupTableViewBackground
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setupViews() {
        addSubview(titleLabel)
        addSubview(separatorView)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}

final class HeaderView: UICollectionReusableView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupViews() {
        addSubview(titleLabel)
        addSubview(separatorView)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        separatorView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension HomeDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! UserCell
        cell.backgroundColor = .white
        cell.update(with: users[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
            return headerView
        } else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId, for: indexPath) as! FooterView
            return footerView
        }
    }

}

extension HomeDataSource: UICollectionViewDelegate {

}

extension HomeDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}







