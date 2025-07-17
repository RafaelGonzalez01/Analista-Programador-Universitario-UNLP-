package main

import "fmt"

func pxng(m chan string, str string, done chan bool) {
	m <- str
	done <- true
}
func main() {

	messages := make(chan string, 10)

	done := make(chan bool)

	for i := 0; i < 5; i++ {
		go pxng(messages, "PING", done)
		<-done
		fmt.Println(<-messages)
		go pxng(messages, "PONG", done)
		<-done
		fmt.Println(<-messages)
	}
}
