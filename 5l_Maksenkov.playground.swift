/**

                            Online Swift Compiler.
                Code, Compile, Run and Debug Swift script online.
Write your code in this editor and press "Run" button to execute it.

*/
import Foundation

enum Windows {
    case open, close    // варинаты дейтвия с окнами открыт/закрыт
}

enum Engin {
    case start, stop    // варинаты дейтвия двигателя запущен/остановлен
}

enum Moschnost {
    case m250, m350     // варинаты Мощности
}

enum Vmestimost {
    case t100, t200     // количество тонн
}

enum Body {
    case bagagnik, kuzov    // тип кузова/багажника
}

enum Work {
    case p20, p50     // варианты погрузки p-погрузка на такую величину
}
//==============================================================================
protocol Auto {
    var marka : String {get set}     // марка автомобиля
    var age : Int {get set}           // вораст авто
    var volumbody : Int {get set}     // Объем багажника изначальный
    var windows : Windows {get set}   // состояние окон
    var engin : Engin {get set}     // состояние двигателя
    var body : Body {get set}       // тип кузова/багажника
    var volumenew : Int {get set}    // новый объем багажника или кузова после погрузки

    func getInfo() -> String

    func pogruzka(work: Work)->(Int)   // функцимя покгрузки
}
//==============================================================================
extension Auto {                    
    mutating func winopen() {     // функция Открытия окон
        windows = .open
    }
    mutating func winclose() {     // функция Закрытия окон
        windows = .close
    }
    mutating func engstart() {     // функция запуска двигателя
        engin = .start
    }
    mutating func engstop() {     // функция остановки двигателя
        engin = .stop
    }
    func pogruzka(work: Work)->(Int){   // функцимя покгрузки
        var volumenew: Int
        switch work {
               case .p20: 
                  volumenew = volumbody + 20
               case .p50: 
                  volumenew = volumbody + 50
        } 
    return volumenew  
    }
}

//==============================================================================
class sportCar : Auto, CustomStringConvertible {
    var marka : String      // марка автомобиля
    var age : Int            // вораст авто
    var volumbody : Int      // Объем багажника изначальный
    var windows : Windows    // состояние окон
    var engin : Engin      // состояние двигателя
    var body : Body        // тип кузова/багажника
    var volumenew : Int     // новый объем багажника или кузова после погрузки
    var ls : Moschnost   //Мощность в лошадиных силах
    
    var description: String {
        return "Описание спортивной машины \(marka)"
    }
        
    init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int, ls: Moschnost) {
        self.marka = marka  
        self.age = age
        self.volumbody = volumbody
        self.windows = windows
        self.engin = engin
        self.body = body
        self.volumenew = volumenew 
        self.ls = ls
    }
    
    func tuning(){
        self.ls = .m350
    }
    
    func getInfo() -> String{
        return "Марка: \(marka). Год выпуска: \(age). Двигатель в работе: \(engin). Окна: \(windows). Мощность: \(ls)."
    }
}
//==============================================================================
class trunkCar : Auto, CustomStringConvertible {

    var marka : String      // марка автомобиля
    var age : Int            // вораст авто
    var volumbody : Int      // Объем багажника изначальный
    var windows : Windows    // состояние окон
    var engin : Engin      // состояние двигателя
    var body : Body        // тип кузова/багажника
    var volumenew : Int     // новый объем багажника или кузова после погрузки
    var kuz : Vmestimost    // вместимость
    
    var description: String {
        return "Описание грузовика \(marka)"
    }
        
    init(marka: String, age: Int, volumbody: Int, windows: Windows, engin: Engin, body: Body, volumenew: Int, kuz: Vmestimost) {
        self.marka = marka  
        self.age = age
        self.volumbody = volumbody
        self.windows = windows
        self.engin = engin
        self.body = body
        self.volumenew = volumenew
        self.kuz = kuz
    }
 
    func pricep(){      // прикрепление прицепа с доп цистерной
       kuz = .t200
    }
    func getInfo() -> String{
        return "Марка: \(marka). Год выпуска: \(age). Двигатель в работе: \(engin). Изначальная загрузка: \(volumbody). Вместимость: \(kuz)."
    }
}
//==============================================================================


var sportauto = sportCar(marka: "Ferrary",age: 1992, volumbody: 10, windows: .close, engin: .stop, body: .bagagnik, volumenew: 100, ls: .m250)
print(sportauto.getInfo()) 
sportauto.tuning()      // увеличилась мощность
sportauto.engstart()    // завелся двигатель
print(sportauto.getInfo())
sportauto.winopen()         // открылись окна
print(sportauto.getInfo())
print(sportauto)

print("================================================================================================")

var trunkauto = trunkCar(marka: "Man",age: 1992, volumbody: 10, windows: .close, engin: .stop, body: .bagagnik, volumenew: 100, kuz: .t100)
print(trunkauto.getInfo()) 
trunkauto.pricep()
print(trunkauto.getInfo())
print("После погрузки машина загружена на: ", trunkauto.pogruzka(work: .p50)) 
print(trunkauto)