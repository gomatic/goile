#include "_cgo_export.h"
#include <stdlib.h>
#include <libguile.h>

SCM hostname (void) {
  char *s = getenv ("HOSTNAME");
  if (s == NULL) {
    return SCM_BOOL_F;
  } else {
    return scm_from_locale_string (s);
  }
}

void inner_main (void *data, int argc, char *argv[]) {
  scm_c_define_gsubr ("hostname", 0, 0, 0, hostname);
  scm_shell (argc, argv);
}

int boot_guile(int argc, char *argv[]) {
  scm_boot_guile (argc, argv, inner_main, 0);
  return 0; /* never reached */
}
