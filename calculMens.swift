import UIKit

class calculMens: UIViewController {
    //Déclaration des differents objets
    @IBOutlet weak var montantPretLabel: UILabel!
    @IBOutlet weak var dureeLabel: UILabel!
    @IBOutlet weak var tauxLabel: UILabel!
    @IBOutlet weak var montantTotalLabel: UILabel!
    @IBOutlet weak var mensualiteLabel: UILabel!
    
    @IBOutlet weak var stepperMontant: UIStepper!
    @IBOutlet weak var stepperTaux: UIStepper!
    
    @IBOutlet weak var dureeSlider: UISlider!
    
    @IBAction func changedStepperM(_ sender: UIStepper) {
        updateDisplay()
    }
    
    @IBAction func changedStepT(_ sender: UIStepper) {
        updateDisplay()
    }
    
    @IBAction func changedSlideD(_ sender: UISlider) {
        updateDisplay()
    }
    
    func updateDisplay(){
        let montantP = stepperMontant.value //montantP prend la valeur du stepper qui lui ai affecté
        montantPretLabel.text = String(montantP)//change le texte et prend la valeur de montantP (convertis en chaine de caractere
        let dureeP = Int(dureeSlider.value)//dureeP prend la valeur du slider qui lui ai affecté
        dureeLabel.text = String(dureeP)//change le texte et prend la valeur de la duree (convertis en chaine de caractere
        let tauxP = stepperTaux.value//tauxP prend la valeur du stepper qui lui ai affecté
        tauxLabel.text = String(format: "%.2f",tauxP)//change le texte et prend la valeur du tauxP (convertis en chaine de caractere avec deux décimales)
        let montantTotal = Double(montantP)*(1+(tauxP/100)) //Formule permettant de calculer la valeur du livret donnés par les BTS banque
        montantTotalLabel.text = String(format: "%.2f",montantTotal)//change le texte et prend la valeur de montantTotale (convertis en chaine de caractere avec deux décimales)
        let mens = montantTotal/Double((dureeP*12))
        mensualiteLabel.text = String(format:"%.2f",mens)//change le texte et prend la valeur de mens (convertis en chaine de caractere avec deux décimales)
    }
    override func viewDidLoad() {
        stepperTaux.stepValue = 0.1 //affectation d'un pas de 0.1 pour le stepper lié au taux
        super.viewDidLoad()
        updateDisplay()

        // Do any additional setup after loading the view.
    }
    

}
