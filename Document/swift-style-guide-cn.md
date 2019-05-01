郑重声明：  
如果看不懂，估计是我翻译的不好  
233333  

##[原版](https://github.com/github/swift-style-guide) 戳这里  

哪里不对或者不准确的，若能指出（我把原文贴上来了，用来对照 2015-12-13）  
感激不尽~~~  

如果没能及时更新，可能比较忙，或者比较懒 →_→    
可以 `Email` 或 翻译后，`pull request`


---

#Swift 编码规范 

A guide to our Swift style and conventions.

This is an attempt to encourage patterns that accomplish the following goals (in
rough priority order):

 1. Increased rigor, and decreased likelihood of programmer error
 1. Increased clarity of intent
 1. Reduced verbosity
 1. Fewer debates about aesthetics

If you have suggestions, please see our [contribution guidelines](CONTRIBUTING.md),
then open a pull request. :zap:

本文尝试做到以下几点 （大概的先后顺序）：

1. 增进精确，减少程序员犯错的可能
1. 明确意图
1. 减少冗余
1. 少量关于美的讨论

如果你有什么建议，请看我们的 [贡献导引](CONTRIBUTING.md)，然后开个 `pull request`.  :zap:

----

#### Whitespace

 * Tabs, not spaces.
 * End files with a newline.
 * Make liberal use of vertical whitespace to divide code into logical chunks.
 * Don’t leave trailing whitespace.
   * Not even leading indentation on blank lines.

#### 留空白

 * 用 Tabs，而非 空格
 * 文件结束时留一空行
 * 用足够的空行把代码分割成合理的块
 * 不要在一行结尾留下空白
   * 千万别在空行留下缩进

#### Prefer `let`-bindings over `var`-bindings wherever possible
#### 能用 `let` 尽量用 `let` 而不是 `var`

Use `let foo = …` over `var foo = …` wherever possible (and when in doubt). Only use `var` if you absolutely have to (i.e. you *know* that the value might change, e.g. when using the `weak` storage modifier).

_Rationale:_ The intent and meaning of both keywords is clear, but *let-by-default* results in safer and clearer code.

尽可能的用 `let foo = ...` 而不是 `var foo = ...` （并且包括你疑惑的时候）。万不得已的时候，再用 `var` （就是说：你 *知道* 这个值会改变，比如：有 `weak` 修饰的存储变量）。

_理由：_ 这俩关键字 无论意图还是意义 都很清楚了，但是 *let* 可以产生安全清晰的代码。

A `let`-binding guarantees and *clearly signals to the programmer* that its value will never change. Subsequent code can thus make stronger assumptions about its usage.

It becomes easier to reason about code. Had you used `var` while still making the assumption that the value never changed, you would have to manually check that.

Accordingly, whenever you see a `var` identifier being used, assume that it will change and ask yourself why.


`let`-有保障 并且它的值的永远不会变对程序猿也是个 *清晰的标记*，对于它的用法，之后的代码可以做个强而有力的推断。

猜测代码更容易了。不然一旦你用了 `var`，还要去推测值会不会变，这时候你就不得不人肉去检查。

这样，无论何时你看到 `var`，就假设它会变，并问自己为啥。

#### Return and break early
#### 尽早地 `Return` 或者 `break` 

When you have to meet certain criteria to continue execution, try to exit early. So, instead of this:  

当你遇到某些操作需要通过条件判断去执行，应当尽早地退出判断条件：你不应该用下面这种写法

```swift
if n.isNumber {
    // Use n here
} else {
    return
}
```

use this:
```swift
guard n.isNumber else {
    return
}
// Use n here
```

You can also do it with `if` statement, but using `guard` is prefered, because `guard` statement without `return`, `break` or `continue` produces a compile-time error, so exit is guaranteed.

或者你也可以用 `if` 声明，但是我们推荐你使用 `guard`

_理由：_ 你一但声明 `guard` 编译器会强制要求你和 `return`, `break` 或者 `continue` 一起搭配使用，否则会产生一个编译时的错误。 


#### Avoid Using Force-Unwrapping of Optionals
#### 避免对 可选类型 强解包

If you have an identifier `foo` of type `FooType?` or `FooType!`, don't force-unwrap it to get to the underlying value (`foo!`) if possible.

如果你有个 `FooType?` 或 `FooType!` 的 `foo`，尽量不要强行展开它以得到基本类型（`foo!`）。

Instead, prefer this:

```swift
if let foo = foo {
    // Use unwrapped `foo` value in here
} else {
    // If appropriate, handle the case where the optional is nil
}
```

Alternatively, you might want to use Swift's Optional Chaining in some of these cases, such as:

或者使用可选链，比如：

```swift
// Call the function if `foo` is not nil. If `foo` is nil, ignore we ever tried to make the call
foo?.callSomethingIfFooIsNotNil()
```

_Rationale:_ Explicit `if let`-binding of optionals results in safer code. Force unwrapping is more prone to lead to runtime crashes.

_理由：_ `if let` 绑定可选类型产生了更安全的代码，强行展开很可能导致运行时崩溃。


#### Avoid Using Implicitly Unwrapped Optionals
#### 避免毫无保留地展开可选类型

Where possible, use `let foo: FooType?` instead of `let foo: FooType!` if `foo` may be nil (Note that in general, `?` can be used instead of `!`).

_Rationale:_ Explicit optionals result in safer code. Implicitly unwrapped optionals have the potential of crashing at runtime.

如果 foo 可能为 nil ，尽可能的用 `let foo: FooType?` 代替 `let foo: FooType!`（注意：一般情况下，`?`可以代替`!`）

_理由:_ 明确的可选类型产生了更安全的代码。无保留地展开可选类型也会挂。


#### Prefer implicit getters on read-only properties and subscripts
#### 对于只读属性的 `properties` 和 `subscripts`，选用隐式的 getters 方法

When possible, omit the `get` keyword on read-only computed properties and
read-only subscripts.

如果可以，省略只读属性的 `properties` 和 `subscripts` 的 `get` 关键字

So, write these:

```swift
var myGreatProperty: Int {
	return 4
}

subscript(index: Int) -> T {
    return objects[index]
}
```

… not these:

```swift
var myGreatProperty: Int {
	get {
		return 4
	}
}

subscript(index: Int) -> T {
    get {
        return objects[index]
    }
}
```

_Rationale:_ The intent and meaning of the first version is clear, and results in less code.

_理由:_ 第一个版本的代码意图已经很清楚了，并且用了更少的代码

#### Always specify access control explicitly for top-level definitions
#### 对于顶级定义，永远明确的列出权限控制

Top-level functions, types, and variables should always have explicit access control specifiers:

顶级函数，类型和变量，永远应该有着详尽的权限控制说明符


```swift
public var whoopsGlobalState: Int
internal struct TheFez {}
private func doTheThings(things: [Thing]) {}
```

However, definitions within those can leave access control implicit, where appropriate:

当然，这样也是恰当的，因为用了隐式权限控制

```swift
internal struct TheFez {
	var owner: Person = Joshaber()
}
```

_Rationale:_ It's rarely appropriate for top-level definitions to be specifically `internal`, and being explicit ensures that careful thought goes into that decision. Within a definition, reusing the same access control specifier is just duplicative, and the default is usually reasonable.

_理由:_ 顶级定义指定为 `internal`很少有恰当的，要明确的确保经过了仔细的判断。有了一个定义，重用同样的权限控制说明符就显得重复，所以默认的通常是合理的。

#### When specifying a type, always associate the colon with the identifier
#### 当指定一个类型时，把 冒号和标识符 连在一起

When specifying the type of an identifier, always put the colon immediately
after the identifier, followed by a space and then the type name.

当指定标示符的类型时，冒号要紧跟着标示符，然后空一格再写类型

```swift
class SmallBatchSustainableFairtrade: Coffee { ... }

let timeToCoffee: NSTimeInterval = 2

func makeCoffee(type: CoffeeType) -> Coffee { ... }
```

_Rationale:_ The type specifier is saying something about the _identifier_ so
it should be positioned with it.

_理由:_ 类型区分号是对于 _identifier_ 来说的，所以要跟它连在一起。

Also, when specifying the type of a dictionary, always put the colon immediately after the key type, followed by a space and then the value type.

此外，指定字典类型时，键类型后紧跟着冒号，接着加一个空格，之后才是值类型。

```swift
let capitals: [Country: City] = [ Sweden: Stockholm ]
```


#### Only explicitly refer to `self` when required
#### 需要时才写上 `self`

When accessing properties or methods on `self`, leave the reference to `self` implicit by default:

当调用 `self` 的 `properties` 或 `methods` 时，`self` 用默认的隐式引用：

```swift
private class History {
	var events: [Event]

	func rewrite() {
		events = []
	}
}
```

Only include the explicit keyword when required by the language—for example, in a closure, or when parameter names conflict:

必要的时候再加上`self`, 比如在闭包里，或者 参数名冲突了：

```swift
extension History {
	init(events: [Event]) {
		self.events = events
	}

	var whenVictorious: () -> () {
		return {
			self.rewrite()
		}
	}
}
```

_Rationale:_ This makes the capturing semantics of `self` stand out more in closures, and avoids verbosity elsewhere.

_原因:_ 在闭包里用`self`更加凸显它的语义，并且避免了别处的冗长


#### Prefer structs over classes
#### 首选 `structs` 而非 `classes`

Unless you require functionality that can only be provided by a class (like identity or deinitializers), implement a struct instead.

Note that inheritance is (by itself) usually _not_ a good reason to use classes, because polymorphism can be provided by protocols, and implementation reuse can be provided through composition.

For example, this class hierarchy:


除非你需要 `class` 才能提供的功能（比如 `identity` 或 `deinitializers`），不然就用 `struct`

要注意到继承通常**不**是用 类 的好理由，因为 多态 可以通过 协议 实现，重用 可以通过 组合 实现。

比如，这个类的分级

```swift
class Vehicle {
    let numberOfWheels: Int

    init(numberOfWheels: Int) {
        self.numberOfWheels = numberOfWheels
    }

    func maximumTotalTirePressure(pressurePerWheel: Float) -> Float {
        return pressurePerWheel * Float(numberOfWheels)
    }
}

class Bicycle: Vehicle {
    init() {
        super.init(numberOfWheels: 2)
    }
}

class Car: Vehicle {
    init() {
        super.init(numberOfWheels: 4)
    }
}
```

could be refactored into these definitions:

可以重构成酱紫：

```swift
protocol Vehicle {
    var numberOfWheels: Int { get }
}

func maximumTotalTirePressure(vehicle: Vehicle, pressurePerWheel: Float) -> Float {
    return pressurePerWheel * Float(vehicle.numberOfWheels)
}

struct Bicycle: Vehicle {
    let numberOfWheels = 2
}

struct Car: Vehicle {
    let numberOfWheels = 4
}
```

_Rationale:_ Value types are simpler, easier to reason about, and behave as expected with the `let` keyword.

_理由:_ 值的类型更简单，容易辨别，并且通过`let`关键字可猜测行为。



#### Make classes `final` by default
#### 默认 `classes` 为 `final`

Classes should start as `final`, and only be changed to allow subclassing if a valid need for inheritance has been identified. Even in that case, as many definitions as possible _within_ the class should be `final` as well, following the same rules.

_Rationale:_ Composition is usually preferable to inheritance, and opting _in_ to inheritance hopefully means that more thought will be put into the decision.

`Classes` 应该用`final`修饰，并且只有在继承的有效需求已被确定时候才能去使用子类。即便在这种情况（前面提到的使用继承的情况）下，根据同样的规则（`Classes` 应该用`final`修饰的规则），类中的定义（属性和方法等）也要尽可能的用 `final` 来修饰

_理由:_ 组合通常比继承更合适，选择使用继承则很可能意味着在做出决定时需要更多的思考。

#### Omit type parameters where possible
#### 能不写类型参数的就别写了

Methods of parameterized types can omit type parameters on the receiving type when they’re identical to the receiver’s. For example:

参数化类型的方法可以省略接收者的类型参数，当他们对接收者来说一样时。比如：

```swift
struct Composite<T> {
	…
	func compose(other: Composite<T>) -> Composite<T> {
		return Composite<T>(self, other)
	}
}
```

could be rendered as:

```swift
struct Composite<T> {
	…
	func compose(other: Composite) -> Composite {
		return Composite(self, other)
	}
}
```

_Rationale:_ Omitting redundant type parameters clarifies the intent, and makes it obvious by contrast when the returned type takes different type parameters.

_理由:_ 省略多余的类型参数让意图更清晰，并且通过对比，让返回值为不同的类型参数的情况也清楚了很多。


#### Use whitespace around operator definitions
#### 操作定义符 两边留空格

Use whitespace around operators when defining them. Instead of:

当定义操作定义符 时，两边留空格。不要酱紫：

```swift
func <|(lhs: Int, rhs: Int) -> Int
func <|<<A>(lhs: A, rhs: A) -> A
```

write:

```swift
func <| (lhs: Int, rhs: Int) -> Int
func <|< <A>(lhs: A, rhs: A) -> A
```

_Rationale:_ Operators consist of punctuation characters, which can make them difficult to read when immediately followed by the punctuation for a type or value parameter list. Adding whitespace separates the two more clearly.

_理由：_ 操作符 由 标点字符组成，当立即连着 类型或者参数值，会让代码非常难读。加上空格分开他们就清晰了


