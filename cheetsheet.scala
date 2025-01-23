for loop : 
    for(i <- 1 until 5) exclusive 5 
    for (i <- 1 to 5) inclusive 5 
    val fruits = List("apple", "banana", "cherry")
    for (String fruit <- fruits)

Keywords:
    if you have to use Keywords as veriable name use ` ` to seperate it from Keywords
    for example : val Keyword
                val `val` =10

Non local returns are no longer supported; use `boundary` and `boundary.break` in `scala.util` instead
    def findFirstGreaterThan10(nums: List[Int]): Int = {
    nums.foreach { num =>
        if (num > 10) return num // Non-local return (deprecated)
    }
    -1 // Default value if no number is greater than 10
    }

    import scala.util.control.Breaks.{break, breakable}

    def findFirstGreaterThan10(nums: List[Int]): Int = {
    var result = -1 // Default value
    breakable {
        for (num <- nums) {
        if (num > 10) {
            result = num
            break() // Exit the loop
        }
        }
    }
    result
    }
