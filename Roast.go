package main

import (
    "bufio"
    "fmt"
    "os"
    "encoding/json"
    "net/http"
    "io/ioutil"
)
type insults struct {
  insult int `json:"insult"`
  }
func main() {
  resp, err := http.Get("https://insult.mattbas.org/api/insult.json")
  if err != nil { 
    fmt.Print(err)
    return
  }
  body, err := ioutil.ReadAll(resp.Body)
  if err != nil {
    fmt.Println(err)
    return
   }
   textBytes := []byte(body)
   data := insults{}
   evrr := json.Unmarshal(textBytes, &data)
   if evrr != nil {
     fmt.Println(err)
     return
	}
  reader := bufio.NewReader(os.Stdin)
  fmt.Print("Enter username: ")
  username, _ := reader.ReadString('\n')
  reponse := username + "," + string(data.insult)
  fmt.Println(reponse)

}
//Not working help!
