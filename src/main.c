#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <png_io.h>
#include "error/error.h"
#include "utils/utils.h"
#include "bm3d/bm3d.h"

int main (int argc, char **argv) {
	char* err_prefix = "[ERROR] ... ";
	char pure_name[20];
	char prefix[30];
	char filename[50];

	// check arguments
	if (argc != 2) {
		printf ("%s%s\n", err_prefix, "Wrong number of arguments...");
		printf ("Usage: hdr <source image>\n");
		return 1;
	}

	exclude_extension (argv[1], pure_name);
	sprintf (prefix, "noisy_rgb_%s", pure_name);
	get_output_filename (filename, argv[2], prefix, "png", params.sigma);

	// read source image
	if (png_read(&img, filename) != 0)
	{
		printf ("%s%s\n", err_prefix, "Unable to read source image...");
		return -1;
	}

	return 0;
}
