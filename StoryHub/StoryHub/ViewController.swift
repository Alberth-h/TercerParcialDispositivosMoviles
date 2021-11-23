//
//  ViewController.swift
//  StoryHub
//
//  Created by Alberto Hoyos on 21/11/21.
//

import UIKit

var stories : [Story] = []

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvStories: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellStory") as! CellStoryController
        
        cell.lblTitle.text = stories[indexPath.row].title
        cell.lblAuthor.text = stories[indexPath.row].author
        cell.lblDate.text = stories[indexPath.row].date
        cell.lblCategory.text = stories[indexPath.row].category
        cell.imgCategory.image = UIImage(named: stories[indexPath.row].category)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToAdd" {
            let destiny = segue.destination as! AddStoryController
            destiny.callBackAddStory = addStory
        }
        if segue.identifier == "GoToDetails" {
            let selectedStory = stories[tvStories.indexPathForSelectedRow!.row]
            let destiny = segue.destination as! DetailsStoryController
            destiny.story = selectedStory
            destiny.index = tvStories.indexPathForSelectedRow!.row
            destiny.callbackUpdateTVStories = updateTVStories
            destiny.callbackDeleteStory = deleteStory
        }
    }

    override func viewDidLoad() {
        self.title = "StoryHub"
        super.viewDidLoad()
        
        stories.append(Story(id: "1", title: "Me encontre 5 pesos", author: "Daniel", date: "12/11/21", category: "DailyLife", country: "Mexico", language: "Spanish", phone: "61616161", email: "daniel@email.com", content: "Un dia estaba bien casual en la calle de regreso a mi casa y me encontree 5 pesos tirados fui al oxxo y me compre un chicle."))
        stories.append(Story(id: "2", title: "Un pequeño chascarrillo", author: "Don Chepo", date: "18/11/21", category: "Fun", country: "Mexico", language: "Spanish", phone: "62626262", email: "chepo@email.com", content: "Chiste: Un hombre le dice a otro ¿Tienes WiFi?, le responde si, y el otro le pregunta ¿Y cuál es la clave? y el otro le responde tener dinero y pagarlo."))
        stories.append(Story(id: "3", title: "The light from the tree", author: "Jonh D.", date: "07/10/21", category: "Fantasy", country: "USA", language: "English", phone: "51515151", email: "john@email.com", content: "It was a dark day, i walked around in the deep of the forest, i found myself alone and the feeling of loneliness start to take over but i see light, a light that come from the tree."))
        stories.append(Story(id: "4", title: "Guarden", author: "Bryan Mora", date: "22/11/21", category: "Tip", country: "Mexico", language: "Spanish", phone: "6441624310", email: "brian_alexis_99@hotmail.com", content: "Recuerden que cada vez que abran un proyecto y esten trabajando recuerden guardar."))
        stories.append(Story(id: "5", title: "Amor de compas", author: "Jesus Gastelum", date: "21/11/21", category: "Love", country: "Mexico", language: "Spanish", phone: "6444477007", email: "jesus.gastelum.e@lasallenoroeste.edu.mx", content: "Dos amigos trabajaban en producir un video juntos, me encontre viendolos divertirse juntos, lo abrazaba con pasion, me les acerseque, les dije ESO ES AMOR DE COMPAS, posen para la foto, ellos prodecieron, tremenda referencia al titanic."))
        stories.append(Story(id: "6", title: "¿Quién apagó las psicofonías?", author: "Mario", date: "06/06/21", category: "MysteryHorror", country: "Argentina", language: "Spanish", phone: "71717171", email: "mario@email.com", content: "Lo que me dispongo a relatar es absolutamente verídico y relativamente reciente. Un compañero de clase me proporcionó un CD que tenía grabadas algunas psicofonías. Mi hermano me propuso llevarme un portátil, y así lo hicimos. Antes de escuchar la primera psicofonía hacía una advertencia: “Nunca lo escuchen a oscuras”. Para asustar a mi hermano, apagué la luz del cuarto de baño y él gritó: “¡Enciende la luz!”. Cuando la encendí, el disco ya no sonaba. ¿Quién apagó las psicofonías?"))
        stories.append(Story(id: "7", title: "Logre salvar el semestre", author: "Maria", date: "22/11/21", category: "DailyLife", country: "Mexico", language: "Spanish", phone: "69696969", email: "maria123@email.com", content: "Soy estudiante de Ingenieria, todo el semestre me ha ido muy mal, todo lo deje para el final, pero por fin lo consegui, me puse leer y ver todo lo que vimos, pedi ayuda a una amiga y logre."))
        stories.append(Story(id: "8", title: "Rompi el lavado del foraneo", author: "anonimo", date: "08/10/21", category: "Fun", country: "Mexico", language: "Spanish", phone: "60606060", email: "juan@email.com", content: "Antes que nada, quiero decir que mi estado de ebriedad no era tan alto, procediendo fue un dia casual despues de clases que decidimos ir varios amigos a la casa del foraneo a divertirnos un rato, pero inesperadamente todo se fue de control y muchos ya estaban botados, yo queria ir al baño, fui, pero el piso estaba resbaloso, cai junto al lavado y lo rompi, por suerte luis estaba borracho y no se dio cuenta cuando me fui, luis si lees esto ya no vivo en Ecatepec"))
        stories.append(Story(id: "9", title: "¿Sabías que una pelota de golf puede ser más letal que una bala?", author: "El pepe", date: "11/11/21", category: "Tip", country: "Mexico", language: "Spanish", phone: "66666666", email: "pepe@email.com", content: "Un estudio realizado por el forense español Carlos Guerrero explica que el impacto que una pelota de golf puede producir en una persona es más grave que el de un disparo de pistola, si la bola alcanza las velocidades cercanas a los 300 kilómetros por hora."))
        stories.append(Story(id: "10", title: "ཉིན་ལྟར་ཐོན་བཞིན་པའི་བོད་དང་ཨ་རིའི་གསར་འགྱུར་ཁག་དང་།", author: "བྱེས་ཀྱི་གདན་ས་དག", date: "29/02/20", category: "MysteryHorror", country: "???", language: "ར་འགྱུར་ཁག་དང་", phone: "666-666", email: "xyz@email.com", content: "བེ་རི་འཇིགས་མེད་དབང་རྒྱལ།. དེ་ལྟར་རྒྱས་པའི་ལུགས་སུ་བྱས་པའི་བཙན་བྱོལ་བོད་ཀྱི་ཤེས་རིག་ཟློས་གར་ཚོགས་པ་ཇི་ལྟར་བྱུང་བའི་རིམ་པ་བརྗོད་ནས།སར་ལས་ཁང་གི་གསར་འགོད་པས།. ༢༠༡༣-༠༢-༠༨. ༢༠༡༣ ཟླ་ ༢ ཚེས་ ༨ རེས་གཟའ་པ་སངས། ༄༅། །བརྒྱུད་ལམ་ཁག་ནང་གནས་ཚུལ་ཐོན་གསལ་་དྲུང་བོན་སྤྱི་འཐུས་དགེ་བཤེས་ཨ་ཀྲོང་རིན་ཆེནར་བྱུང་བའི་རིམ་པ་བརྗོད་ནས།སར་ལས་ཁང་གི་གསར་འགོད་པས།. ༢༠༡༣-༠༢-༠༨.ས་གཟའ་པ་སངས། ༄༅། །བརྒྱུད་ལམ་ཁག་ནང་གནས་ཚུལ་ཐོན་གསལ་་དྲུང་བོན་སྤྱི་འཐུས་དགེ་བཤེས་ཨ་ཀྲོང་རིན་ཆེནརས། ༄༅། །བརྒྱུད་ལམ་ཁག་ནང་གནས་ཚུལ་ཐོན་གསལ་་དྲུང་བོན་སྤྱི་འཐུས་དགེ་བཤེས་ཨ་ཀྲོང་རིན་ཆེནར་བྱུང་བའི་རིམ་པ་བརྗོད་ནས།སར་ལས་ཁང་གི་གསར་འགོད་པས།. ༢༠༡༣-༠༢-༠༨.ས་གཟའ་པ་སངས། ༄༅། །བརྒྱུད་ལམ་ཁག་ནང་གནསས།. ༢༠༡༣-༠༢-༠༨. ༢༠༡༣ ཟླ་ ༢ ཚེས་ ༨ རེས་གཟའ་པ་སངས། ༄༅། །བརྒྱུད་ལམ་ཁག་ནང་གནས་ཚུལ་ཐོན་གསལ་་དྲུང་བོན་སྤྱི་འཐུས"))
    }

    func updateTVStories() {
        tvStories.reloadData()
    }
    
    func deleteStory(index : Int) {
        stories.remove(at: index)
        updateTVStories()
    }
    
    func addStory(story: Story) {
        stories.append(story)
        updateTVStories()
    }
}

