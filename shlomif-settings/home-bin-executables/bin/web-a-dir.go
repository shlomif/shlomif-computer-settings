// web-a-dir - serve files in a directory tree at some port

// Copyright Jeremy Mates

// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.

// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

// Taken from https://github.com/thrig/scripts/blob/1fa8dead296467f7da82d325e952bfe7ea3169be/network/web-a-dir.go
// - Thanks!
//
// Used by trim-minicpan.

package main

import (
	"errors"
	"fmt"
	"log"
	"net"
	"net/http"
	"net/url"
	"os"
	"strconv"
	"strings"
)

func main() {
	if len(os.Args) != 3 {
		fmt.Fprintf(os.Stderr, "Usage: web-a-dir port directory\n")
		os.Exit(64)
	}

	directory := os.Args[2]
	if _, err := os.Stat(directory); os.IsNotExist(err) {
		fmt.Fprintf(os.Stderr, "web-a-dir: no such directory '%s'\n", directory)
		os.Exit(1)
	}

	listen, host, port, err := ParsePort(os.Args[1])
	FailIf(err)

	if len(host) > 0 {
		PrintHost(host, port)
	} else {
		PrintLocalAddresses(port)
	}

	fserver := http.FileServer(http.Dir(directory))

	log.Fatal(http.ListenAndServe(listen, fserver))
}

func FailIf(err error) {
	if err != nil {
		fmt.Fprintf(os.Stderr, "web-a-dir: %s\n", err.Error())
		os.Exit(1)
	}
}

func ParsePort(arg string) (string, string, int, error) {
	var host string

	index := strings.LastIndex(arg, ":")

	if index == -1 {
		port, err := strconv.Atoi(arg)
		return ":" + arg, host, port, err
	}

	if index == len(arg) - 1 {
		return "", "", 0, errors.New("port must not end with \":\"")
	}
	if index > 0 {
		host = arg[0:index]
	}

	port, err := strconv.Atoi(arg[index+1:])

	return arg, host, port, err
}

func PrintHost(host string, port int) {
	uri := url.URL{
		Host:   fmt.Sprintf("%s:%d", host, port),
		Scheme: "http",
	}
	fmt.Println(uri.String())
}

// for easy copy-n-paste of the address on a particular interface
// (unless a specific address was given via the "port" argument)
func PrintLocalAddresses(port int) {
	var count int
	interfaces, err := net.Interfaces()
	FailIf(err)
	for _, netif := range interfaces {
		addresses, err := netif.Addrs()
		FailIf(err)
		for _, addr := range addresses {
			ipnet, ok := addr.(*net.IPNet)
			if !(ok && ipnet.IP.IsGlobalUnicast()) {
				continue
			}
			tcp := net.TCPAddr{
				IP:   ipnet.IP,
				Port: port,
			}
			uri := url.URL{
				Host:   tcp.String(),
				Scheme: "http",
			}
			fmt.Println(netif.Name, uri.String())
			count++
		}
	}
	if count == 0 {
		// most likely that laptop is not on the interwebs, or
		// that `net-home` must be run to allow communication
		// with the 2009 macbook
		fmt.Printf("http://localhost:%d\n", port)
	}
}
