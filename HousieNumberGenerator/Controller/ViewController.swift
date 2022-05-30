import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var numLabels: [UILabel]!
    @IBOutlet weak var previousNumberLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var nextNumberButton: UIButton!
    @IBOutlet var stacks: [UIStackView]!
    
    private var housieModel = HousieModel()
    private var speaker = Speaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousNumberLabel.text = ""
        currentNumberLabel.text = ""
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction(_:)))
        for numLabel in numLabels {
            numLabel.addGestureRecognizer(tap)
        }
    }
    
    @IBAction func generateNumber(_ sender: UIButton) {
        nextNumberButton.isEnabled = false
        let newNumber = housieModel.generateNewNumber()
        if housieModel.getPreviousNumber() != 0 {
            previousNumberLabel.text = "\(housieModel.getPreviousNumber())"
        }
        currentNumberLabel.text = "\(newNumber)"
        speaker.speak(toSpeak: housieModel.getTextToSpeak()) {
            self.nextNumberButton.isEnabled = true
        }
        numLabels[newNumber - 1].backgroundColor = .systemBlue
        numLabels[newNumber - 1].textColor = .white
    }
    
    @objc func tapFunction(_ sender: UIView) {
        print("jbjbjbj")
        //housieModel.setHackedNumber(tapRecognizer.number)
    }
    
    class LabelTapGestureRecognizer: UITapGestureRecognizer {
        let number: Int
        init(target: AnyObject, action: Selector, number: Int) {
            self.number = number
            super.init(target: target, action: action)
        }
    }
}

