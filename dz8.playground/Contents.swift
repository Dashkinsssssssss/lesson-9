import UIKit



var students: [String] = ["Mark", "John", "Tom", "Adam", "David", "Alex", "Boll", "Stiv", "Anton", "Lii", "Dolik", "Cople"]
students.append("Alice")
students.append("Dasha")
students.append("Sonya")
students.append("Amanda")
students.insert("Dina", at: 3)
students.insert("Guzelle", at:5)
students.insert("Dora", at: 9)

print(students)


students.remove(at: 10)
students.remove(at: 8)
students.remove(at: 7)
students.remove(at: 1)
students.remove(at: 3)
students.removeFirst(2)
students.removeLast(2)

print(students)

func site(name: String, surname: String, nickname: String, mail: String, password: String)  {
    
}
    print("name: Дарья")
    print("surname: Осипович")
    print("nickname: Dashkinssssssss")
    print("mail: Dashkins8@mail,ru")
    print("password: D123Asha")




class Character {
    var weaponDamage: Int
    var health: Int
    var armor: Int
    var evasion: Bool
    
    init(weaponDamage: Int, health: Int, armor: Int, evasion: Bool) {
        self.weaponDamage = weaponDamage
        self.health = health
        self.armor = armor
        self.evasion = evasion
    }
    
    func attack(_ target: Character) {
        if target.evasion && target.health > 0 {
            print("\(self) промахивается по \(target).")
        } else {
            let damage = weaponDamage - target.armor
            target.health -= max(0, damage)
            print("\(self) атакует \(target) и наносит \(damage) урона. У \(target) осталось \(target.health) жизней.")
        }
    }
    
    var description: String {
        return "\(type(of: self)): weaponDamage=\(weaponDamage), health=\(health), armor=\(armor), evasion=\(evasion)"
    }
}

class Human: Character {
    init() {
        super.init(weaponDamage: 4, health: 9, armor: 5, evasion: false)
    }
}

class Elf: Character {
    init() {
        super.init(weaponDamage: 6, health: 8, armor: 0, evasion: true)
    }
}

class Orc: Character {
    init() {
        super.init(weaponDamage: 3, health: 10, armor: 10, evasion: false)
    }
    
    override func attack(_ target: Character) {
        if target.armor > 0 {
            target.armor -= weaponDamage
            print("\(self) атакует \(target) и наносит \(weaponDamage) урона броне. У \(target) осталось \(target.armor) брони.")
        } else {
            super.attack(target)
        }
    }
}

func tournament() {
    let human = Human()
    let elf = Elf()
    let orc = Orc()
    
    print("Участники турнира:")
    print(human.description)
    print(elf.description)
    print(orc.description)
    print()
    
    var fighters = [human, elf, orc]
    
    while fighters.count > 1 {
        for attacker in fighters {
            guard let target = fighters.first(where: { \$0 !== attacker }) else {
                continue
            }
            
            attacker.attack(target)
            
            if target.health <= 0 {
                print("\(target) погиб.")
                fighters.remove(at: fighters.firstIndex(of: target)!)
            }
        }
    }
    
    if let winner = fighters.first {
        print("\(winner) победил в турнире!")
    }
}

tournament()



