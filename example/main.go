package main

/*
#include <stdio.h>
#include <stdlib.h>

void myprint() {
 printf("Hello world (c)\n)");
}
*/
import "C"
import "fmt"

func main() {
	C.myprint()
	fmt.Println("Hello world (go)")
}

// import "fmt"

// func main() {
// 	fmt.Println("Hello world")
// }
