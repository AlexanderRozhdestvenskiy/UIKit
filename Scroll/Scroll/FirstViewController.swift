//
//  ViewController.swift
//  Scroll
//
//  Created by Alexander Rozhdestvenskiy on 24.03.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .white
        label.text = "Стоимость подписки составляет 249 руб. в месяц по окончании пробного периода. Предложение действительно в течение 3 месяцев после активации соответствующего устройства. Единая подписка на всю группу Семейного доступа. Подписка продлевается автоматически; отказаться можно в любой момент. Имеются определённые ограничения и другие условия."
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.textColor = .white
        label.text = "— Eh bien, mon prince. Gênes et Lucques ne sont plus que des apanages, des поместья, de la famille Buonaparte. Non, je vous préviens que si vous ne me dites pas que nous avons la guerre, si vous vous permettez encore de pallier toutes les infamies, toutes les atrocités de cet Antichrist (ma parole, j'y crois) — je ne vous connais plus, vous n'êtes plus mon ami, vous n'êtes plus мой верный раб, comme vous dites 1. Ну, здравствуйте, здравствуйте. Je vois que je vous fais peur 2, садитесь и рассказывайте. Так говорила в июле 1805 года известная Анна Павловна Шерер, фрейлина и приближенная императрицы Марии Феодоровны, встречая важного и чиновного князя Василия, первого приехавшего на ее вечер. Анна Павловна кашляла несколько дней, у нее был грипп, как она говорила (грипп был тогда новое слово, употреблявшееся только редкими). В записочках, разосланных утром с красным лакеем, было написано без различия во всех: «Si vous n'avez rien de mieux à faire, Monsieur le comte (или mon prince), et si la perspective de passer la soirée chez une pauvre malade ne vous effraye pas trop, je serai charmée de vous voir chez moi entre 7 et 10 heures. Annette Scherer» 3. — Dieu, quelle virulente sortie! 4 — отвечал, нисколько не смутясь такою встречей, вошедший князь, в придворном, шитом мундире, в чулках, башмаках и звездах, с светлым выражением плоского лица. Он говорил на том изысканном французском языке, на котором не только говорили, но и думали наши деды, и с теми, тихими, покровительственными интонациями, которые свойственны состаревшемуся в свете и при дворе значительному человеку. Он подошел к Анне Павловне, поцеловал ее руку, подставив ей свою надушенную и сияющую лысину, и покойно уселся на диване. — Avant tout dites-moi, comment vous allez, chère amie? 5 Успокойте меня, — сказал он, не изменяя голоса и тоном, в котором из-за приличия и участия просвечивало равнодушие и даже насмешка. — Как можно быть здоровой... когда нравственно страдаешь? Разве можно, имея чувство, оставаться спокойною в наше время? — сказала Анна Павловна. — Вы весь вечер у меня, надеюсь? — А праздник английского посланника? Нынче середа. Мне надо показаться там, — сказал князь. — Дочь заедет за мной и повезет меня. — Я думала, что нынешний праздник отменен, Je vous avoue que toutes ces fêtes et tous ces feux d'artifice commencent à devenir insipides 6. — Ежели бы знали, что вы этого хотите, праздник бы отменили, — сказал князь по привычке, как заведенные часы, говоря вещи, которым он и не хотел, чтобы верили. — Ne me tourmentez pas. Eh bien, qu'a-t-on décidé par rapport à la dépêche de Novosilzoff? Vous savez tout 7. — Как вам сказать? — сказал князь холодным, скучающим тоном. — Qu'a-t-on décidé? On a décidé que Buonaparte a brûlé ses vaisseaux, et je crois que nous sommes en train de brûler les nôtres 8. Князь Василий говорил всегда лениво, как актер говорит роль старой пиесы. Анна Павловна Шерер, напротив, несмотря на свои сорок лет, была преисполнена оживления и порывов. Быть энтузиасткой сделалось ее общественным положением, и иногда, когда ей даже того не хотелось, она, чтобы не обмануть ожиданий людей, знавших ее, делалась энтузиасткой. Сдержанная улыбка, игравшая постоянно на лице Анны Павловны, хотя и не шла к ее отжившим чертам, выражала, как у избалованных детей, постоянное сознание своего милого недостатка, от которого она не хочет, не может и не находит нужным исправляться."
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupView()
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }

    private func setupView() {
        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
}
