import UIKit

class calculInteretEpargne: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{
    var tauxImp : Double = 0.0   //propriété tauxImp initialisé à 0
    var livret = ["Livret A","Livret Jeune","PEL","LDD","LEP","CEL"] //Liste de tous les types de livret sous forme de tableau
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1                                                     //Une seule liste deroulante
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
   return livret.count                                               //Longueur de la liste(nombre d'element du tableau)
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return livret[row]                                           //retourne un element du tableau choisi
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        var taux : Double
        if livret[row] == livret[0] //Selon la selection de l'utilisateur, affecte une valeur a la variable taux
        {
            taux = 0.5 //taux  moyen du Livret A
        }
        else if livret[row] == livret[1]{
            taux = 1.97 //taux  moyen du Livret Jeune
        }
        else if livret[row] == livret[2]{
            taux = 1.27 //taux  moyen du PEL
            
        }
        else if livret[row] == livret[3]{
            taux = 0.5 //taux  moyen du LDD
        }
        else if livret[row] == livret[4]{
            taux = 1.25 //taux  moyen du LEP
        }
        else if livret[row] == livret[5]{
            taux = 0.42 //taux  moyen du CEL
        }
        else {
            taux = 0.75 //taux  initialiser à 0
        }
        tauxLabel.text = String(taux) //change le texte et prend la valeur du taux (convertis en chaine de caractere)
        self.tauxImp = taux //la propriete tauxImp prend la valeur de taux
        calculInteret() //appel la fonction calcul d'interet afin de calculer a chaque changement de valeur
    }
    

    
    //Déclaration des differents objets
    @IBOutlet weak var montantInitialLA: UILabel!
    @IBOutlet weak var tauxLabel: UILabel!
    @IBOutlet weak var livretLabel: UILabel!
    @IBOutlet weak var interetLabel: UILabel!
    @IBOutlet weak var dureeLabel: UILabel!
    
    @IBOutlet weak var montantStepper: UIStepper!
    @IBOutlet weak var dureeSlider: UISlider!
    
    @IBAction func stepperMontantChanged(_ sender: UIStepper) {
        updateDisplay()
    }
    
    @IBAction func sliderDureeChanged(_ sender: UISlider) {
        updateDisplay()
    }
    
    @IBOutlet weak var livretPickerView: UIPickerView!
    func updateDisplay()
    {
        montantInitialLA.text=String(montantStepper.value)//change le texte et prend la valeur du stepper (convertis en chaine de caractere)
        let duree = Int(dureeSlider.value)//change le texte et prend la valeur du slider (convertis en chaine de caractere)
        dureeLabel.text = String(duree) //change le texte et prend la valeur de duree (convertis en chaine de caractere)
        calculInteret()//appel de fonction
        
    }
    
    func calculInteret(){
        let depotInitial = Double(montantStepper.value)//depotInitial prend la valeur du stepper (convertis en nombre a virgule
        let duree = Int(dureeSlider.value)//change le texte et prend la valeur du slider (convertis en chaine de caractere)
        let taux = self.tauxImp //taux prend la valeur de la propriété tauxImp
        let valeurInteret: Double
        let valeurLivret: Double
        valeurInteret = (taux/100)*depotInitial*Double(duree) //Formule de calcul de valeur d'interet donné par les BTS BANQUE
        interetLabel.text = String(format: "%.2f",valeurInteret)//change le texte et prend la valeur de valeur interet (convertis en chaine de caractere)
        valeurLivret = valeurInteret+depotInitial //Valeur Totale du livret
        livretLabel.text = String(format: "%.2f",valeurLivret)//change le texte et prend la valeur de valeur du livret (convertis en chaine de caractere)
        func viewDidLoad() {
        super.viewDidLoad()
        updateDisplay()

        // Do any additional setup after loading the view.
    }
    

    /*

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
