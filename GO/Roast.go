package main

import (
   "encoding/json"
   "fmt"
   "net/http"
)
func main() {
  resp, _ := http.Get("https://insult.mattbas.org/api/insult.json")
  var result map[string]interface{}
  json.NewDecoder(resp.Body).Decode(&result)
  fmt.Println("Enter a random name: ")
  var username string
  fmt.Scanln(&username)
  fmt.Println("Listen Here",username +",",result["insult"])
}
