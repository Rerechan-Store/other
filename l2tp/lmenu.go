package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"os/exec"
	"strings"
)

func addL2TP() {
	fmt.Println("Menambahkan akun L2TP...")
}

func addPPTP() {
	fmt.Println("Menambahkan akun PPTP...")
}

func deleteL2TP() {
	fmt.Println("Menghapus akun L2TP...")
}

func deletePPTP() {
	fmt.Println("Menghapus akun PPTP...")
}

func renewL2TP() {
	fmt.Println("Memperbarui akun L2TP...")
}

func renewPPTP() {
	fmt.Println("Memperbarui akun PPTP...")
}

func checkPPTP() {
	fmt.Println("Memeriksa pengguna yang login ke PPTP...")
}

func menu() {
	clearScreen()

	fmt.Println("==============================")
	fmt.Println("[ <= L2TP & PPTP MENU VPN => ]")
	fmt.Println("==============================")
	fmt.Println("1. Tambahkan Akaun L2TP")
	fmt.Println("2. Tambahkan Akaun PPTP")
	fmt.Println("3. Hapus Akaun L2TP")
	fmt.Println("4. Hapus Akaun PPTP")
	fmt.Println("5. Perbarui Akaun L2TP")
	fmt.Println("6. Perbarui Akaun PPTP")
	fmt.Println("7. Periksa Login PPTP")
	fmt.Println("X. Kembali ke Menu VPN")
	fmt.Println("==============================")

	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Pilih dari opsi [1-7 or x]: ")
	option, _ := reader.ReadString('\n')
	option = strings.TrimSpace(option)

	switch option {
	case "1":
		addL2TP()
	case "2":
		addPPTP()
	case "3":
		deleteL2TP()
	case "4":
		deletePPTP()
	case "5":
		renewL2TP()
	case "6":
		renewPPTP()
	case "7":
		checkPPTP()
	case "x", "X":
		// Kembali ke menu utama VPN
		fmt.Println("Kembali ke menu utama VPN...")
	default:
		fmt.Println("Masukkan nomor yang benar.")
	}

	// Kembali ke menu setelah operasi selesai
	menu()
}

func clearScreen() {
	cmd := exec.Command("clear")
	cmd.Stdout = os.Stdout
	cmd.Run()
}

func main() {
	fmt.Println("Selamat datang di program manajemen VPN!")

	// Memulai menu VPN
	menu()

	// Kode di sini tidak akan pernah tercapai karena menu akan memanggil menu kembali secara rekursif
}
