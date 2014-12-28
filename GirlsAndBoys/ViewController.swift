import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boysAndGirlsLabel: UILabel!
    @IBOutlet weak var boysAndGirlsImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var boys:[boysAndGirls]=[]
    var girls:[boysAndGirls]=[]
    
    var currentPerson = (gender:"Male",index:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.textColor = UIColor.redColor()
        self.genderLabel.textColor = UIColor.redColor()
        self.bornLabel.textColor = UIColor.redColor()
        self.heightLabel.textColor = UIColor.redColor()
        self.boysAndGirlsLabel.textColor = UIColor.redColor()
        
        var boy1 = boysAndGirls()
        boy1.name = "Bradd Pitt"
        boy1.gender = "Male"
        boy1.born = "December 18, 1963"
        boy1.height = "5' 11\" (1.80 m)"
        boy1.image = UIImage(named: "boy1.jpg")
        boy1.tipsFromMales()
        
        var boy2 = boysAndGirls()
        boy2.name = "Chris Hemsworth"
        boy2.gender = "Male"
        boy2.born = "August 11, 1983"
        boy2.height = "6' 3\" (1.90 m)"
        boy2.image = UIImage(named: "boy2.jpg")
        boy2.tipsFromMales()

        var boy3 = boysAndGirls()
        boy3.name = "Hugh Jackman"
        boy3.gender = "Male"
        boy3.born = "October 12, 1968"
        boy3.height = "6' 2\" (1.88 m)"
        boy3.image = UIImage(named: "boy3.jpg")
        boy3.tipsFromMales()

        boys += [boy1,boy2,boy3]

        var girl1 = boysAndGirls()
        girl1.name = "Elsa Pataky"
        girl1.gender = "Female"
        girl1.born = "July 18, 1976"
        girl1.height = "5' 3\" (1.61 m)"
        girl1.image = UIImage(named: "girl1.jpg")
        girl1.tipsFromFemales()

        var girl2 = boysAndGirls()
        girl2.name = "Emma Stone"
        girl2.gender = "Female"
        girl2.born = "November 6, 1988"
        girl2.height = "5' 6\" (1.68 m)"
        girl2.image = UIImage(named: "girl2.jpg")
        girl2.tipsFromFemales()

        var girl3 = boysAndGirls()
        girl3.name = "Miranda Kerr"
        girl3.gender = "Female"
        girl3.born = "April 20, 1983"
        girl3.height = "5' 9\" (1.75 m)"
        girl3.image = UIImage(named: "girl3.jpg")
        girl3.tipsFromFemales()

        girls += [girl1,girl2,girl3]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextToolBarButtonPressed(sender: UIBarButtonItem) {
        self.updatePerson()
        self.updateView()
    }

    func updatePerson(){
        switch currentPerson {
        case ("Male",_):
            var randomIndex = Int(arc4random_uniform(UInt32(girls.count)))
            currentPerson = ("Female",randomIndex)
        default:
            var randomIndex = Int(arc4random_uniform(UInt32(boys.count)))
            currentPerson = ("Male",randomIndex)
        }
    }
    
    func updateView(){
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentPerson.gender == "Male" {
                let boy = self.boys[self.currentPerson.index]
                self.nameLabel.text = boy.name
                self.genderLabel.text = boy.gender
                self.bornLabel.text = boy.born
                self.heightLabel.text = boy.height
                self.boysAndGirlsImage.image = boy.image
                self.boysAndGirlsLabel.text = boy.tipsFromMales()
            } else if self.currentPerson.gender == "Female" {
                let girl = self.girls[self.currentPerson.index]
                self.nameLabel.text = girl.name
                self.genderLabel.text = girl.gender
                self.bornLabel.text = girl.born
                self.heightLabel.text = girl.height
                self.boysAndGirlsImage.image = girl.image
                self.boysAndGirlsLabel.text = girl.tipsFromFemales()
            }
            
            }, completion: { (fininshed: Bool) -> () in
        })
    }
}

