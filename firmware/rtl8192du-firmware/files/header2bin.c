/*

Convert rtl8192du firmware images from header files into binary blobs
usable by the kernel firmware loader.

Copyright Andrew Lunn <andrew@lunn.ch> 2013
Copyright Stefan Lippers-Hollmann <s.l-h@gmx.net 2024 (adaptions for rtl8192du)

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Derived from moxa-firmware:
https://raw.githubusercontent.com/lunn/moxa-firmware/refs/heads/master/header2bin.c
*/

#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>

typedef uint8_t u8;
typedef uint32_t u32;

#include "../hal/Hal8192DUHWImg.c"
#include "../include/Hal8192DUHWImg.h"

#include "../include/Hal8192DUHWImg_wowlan.h"
#include "../hal/Hal8192DUHWImg_wowlan.c"

static void
header2bin(const u8 *data, size_t len, char *fw_name)
{
	char buf[32];
	int fd;
	int ret;
	
	snprintf(buf, sizeof(buf) - 1, "%s.bin", fw_name);
	
	fd = open(buf, O_WRONLY | O_CREAT | O_TRUNC,
		  S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
	if (fd < 0) {
		fprintf(stderr, "Creating file %s: %s\n", buf,
			strerror(errno));
		exit (EXIT_FAILURE);
	}
	
	ret = write(fd, data, len);
	if (ret != len) {
		fprintf(stderr, "Write truncated!\n");
		exit (EXIT_FAILURE);
	}
	if (ret < 0) {
		fprintf(stderr, "Writing data to file: %s\n", strerror(errno));
		exit (EXIT_FAILURE);
	}

	close(fd);
}


int
main(int argc, char * argv[])
{
	header2bin(Rtl8192DUFwImgArray, Rtl8192DUImgArrayLength, "rtl8192dufw");
	header2bin(Rtl8192DUFwWWImgArray, DUWWImgArrayLength, "rtl8192dufw_wol");

	return EXIT_SUCCESS;
}
