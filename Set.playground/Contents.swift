// MARK: SET

/*  “Множество (Set) — это неупорядоченная коллекция уникальных элементов. В отличие от массивов, у элементов множества нет четкого порядка следования, важен лишь факт наличия некоторого значения в множестве. Определенное значение элемента может существовать в нем лишь единожды, то есть каждое значение в пределах одного множества должно быть уникальным. Возможно, в русскоязычной документации по языку Swift вы встречали другое название множеств — наборы.” */

// Задание множеста (набора) происходит с помощью явного указания.
let mySet1: Set = [1, 2, 3]
let mySet2: Set<Int> = [1, 2, 3]
let mySet3 = Set(arrayLiteral: 1, 2, 3)
let mySet4 = Set<Int>(arrayLiteral: 1, 2, 3)

// Множества - это неупорядоченые коллекции элементов. Вывод может быть в разном порядке.
print(mySet1)
print(mySet2)
print(mySet3)
print(mySet4)

// MARK: Пустое множество

// создание пустого множества
let emptySet = Set<String>()
// множество со значениями
var setWithValues: Set<String> = ["хлеб", "овощи"]
// удаление всех элементов множества
setWithValues = []
print(setWithValues) // Set([])

// Для добавления нового элемента, используется метод insert
var musicSet = Set<String>()
// “В результате выполнения метода insert(_:) возвращается кортеж, первый элемент которого содержит значение типа Bool, характеризующее успешность проведенной операции. Если возвращен true — элемент успешно добавлен, если false — он уже существует во множестве.”
musicSet.insert("Rap")
musicSet.insert("Rap")
print(musicSet)

// Для удаления элемента из множества, используется метод remove
var colorSet: Set = ["Yellow", "Blue", "Green"]
var removeExistingColor = colorSet.remove("Blue")
print(removeExistingColor ?? "Blue return nil")
// В случае если такого элемент нет, вернется nil
var remoteNonExistingColor = colorSet.remove("White")
print(remoteNonExistingColor ?? "white return nil")

// Проверка факта наличия значения, осуществляется с помощью метода contains
print(colorSet.contains("Green"))
print(colorSet.contains("Gray-green"))

// Для определения кол-во элементов, можно использовать метод count
colorSet.count

// MARK: Операции со множеством 
