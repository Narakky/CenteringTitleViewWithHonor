import UIKit

final class ResultViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var titleOrTitleViewLabel: UILabel!
    @IBOutlet weak var titleTextLabel: UILabel!

    // MARK: - Variables

    var isTargetTitleView: Bool = false
    private var titleString: String = ""
    private let titleView = CenteringWithHonorTitleView()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        titleOrTitleViewLabel.text = isTargetTitleView ? "navigationItem.titleView" : "navigationItem.title"
        titleTextLabel.text = titleString
        if !isTargetTitleView {
            setNavigationTitlePattern1()
        } else {
            setNavigationTitlePattern2()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        titleView.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - navigationItem.title
    private func setNavigationTitlePattern1() {
        navigationItem.title = "\(titleString)さん"
    }

    // MARK: - navigationItem.titleView
    private func setNavigationTitlePattern2() {
        titleView.setUsername(username: titleString)
        titleView.frame = CGRect.zero
        titleView.isHidden = true
        navigationItem.titleView = titleView
        titleView.sizeToFit()
        navigationController?.navigationBar.setNeedsLayout()
        navigationController?.navigationBar.layoutIfNeeded()
    }

    func setTitle(title: String?) {
        titleString = !(title?.isEmpty ?? true) ? title! : "（未設定）"
    }

}
