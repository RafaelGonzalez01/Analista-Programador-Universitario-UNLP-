package main

import "fmt"

func ej3() {
	/* integers */
	var zz int = 0
	var x = 10
	var z int = x
	var y int8 = int8(x + 1)
	const n = 5001
	const c int = 5001
	/* float */
	var e float32 = 6
	var f float32 = e

	/*impresciones*/
	fmt.Println(zz, ",", z, ",", x, ",", y, ",", n, ",", c, ",", e, ",", f)
}
