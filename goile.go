package main

import (
  "os"
  "unsafe"
)

/*
#cgo pkg-config: guile-2.0
#include <stdlib.h>
extern int boot_guile(int, char*[]);
*/
import "C"

func main() {
  argc := C.int(len(os.Args))
  argv := make([]*C.char, argc)
  for i, arg := range os.Args {
    argv[i] = C.CString(arg)
  }

  C.boot_guile(argc, &argv[0])

  for _, arg := range argv {
    C.free(unsafe.Pointer(arg))
  }
}
