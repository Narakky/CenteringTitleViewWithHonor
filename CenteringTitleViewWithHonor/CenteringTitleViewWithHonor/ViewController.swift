import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var naviTextView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func button1Tapped(_ sender: UIButton) {
        transitionToResultView(isTitleView: false)
    }

    @IBAction func button2Tapped(_ sender: UIButton) {
        transitionToResultView(isTitleView: true)
    }

    private func transitionToResultView(isTitleView: Bool) {
        guard let resultViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "result") as? ResultViewController else { return }
        resultViewController.isTargetTitleView = isTitleView
        resultViewController.setTitle(title: naviTextView.text)
        navigationController?.pushViewController(resultViewController, animated: true)
    }
}
