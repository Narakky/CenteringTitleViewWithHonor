import UIKit

final class CenteringWithHonorTitleView: UIView {

    // MARK: - Variables

    private let usernameLabel = UILabel(frame: CGRect.zero)
    private var usernameLabelSize = CGSize.zero
    private var usernameLabelWidth: CGFloat = 0
    private let honorLabel = UILabel(frame: CGRect.zero)
    private var honorLabelSize = CGSize.zero
    private var honorLabelWidth: CGFloat = 0
    private var isHiddenHonor = false

    // MARK: - Initializer

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        usernameLabel.textAlignment = .right

        honorLabel.font = UIFont.boldSystemFont(ofSize: 17)
        honorLabel.textAlignment = .left
        honorLabel.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = true
        addSubview(usernameLabel)
        addSubview(honorLabel)

    }

    // MARK: - Inner Methods

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        usernameLabelWidth = max(usernameLabel.bounds.width, usernameLabelSize.width)
        honorLabelWidth = isHiddenHonor ? 0 : max(honorLabel.bounds.width, honorLabelSize.width)

        let width = usernameLabelWidth + honorLabelWidth
        let height = usernameLabel.bounds.height
        let size = CGSize(width: width, height: height)
        return size
    }

    override func updateConstraints() {
        removeConstraints(self.constraints)

        self.addConstraints([
            NSLayoutConstraint(item: usernameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: usernameLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: usernameLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: usernameLabel, attribute: .trailing, relatedBy: .equal, toItem: honorLabel, attribute: .leading, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: usernameLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: honorLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: honorLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: honorLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: honorLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: honorLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: honorLabelWidth)
            ])
        super.updateConstraints()
    }

    // Public Methods

    func setUsername(username: String, isHiddenHonor: Bool = false, honor: String = "さん") {
        usernameLabel.text = username
        usernameLabel.sizeToFit()
        usernameLabelSize = usernameLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))

        self.isHiddenHonor = isHiddenHonor
        honorLabel.text = !isHiddenHonor ? honor : ""
        honorLabel.sizeToFit()
        honorLabelSize = honorLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        setNeedsUpdateConstraints()
    }

}
