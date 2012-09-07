#!/bin/sh

# Copyright (c) 2008 John Watson. All rights reserved.
# http://photodoto.com/index.php/2008/02/25/tethered-shooting-with-linux/
# Copyright (c) 2012 Samuel Littley. All Rights Reserved
# http://www.toastwaffle.com : samuel.littley@toastwaffle.com
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice,
#       this list of conditions and the following disclaimer in the documentation
#       and/or other materials provided with the distribution.
#     * Neither the name of the organization nor the names of its contributors
#       may be used to endorse or promote products derived from this software
#       without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

case "$ACTION" in
	init)
		# Called just after gphoto2 starts
		# Return non-zero exit code to abort
		;;

	start)
		# Called just before gphoto2 executes requested commands
		;;

	stop)
		# Called just before gphoto2 ends
		;;

	download)
		# Called just after a file has been downloaded to the computer
		exiftool -r -P -q -overwrite_original -Author='Samuel Littley - samuel.littley@scoutmail.org.uk' -Copyright='©Samuel Littley Creative Commons BY-NC-SA' $ARGUMENT ; ufraw-batch --wb=camera --exposure=auto --interpolation=bilinear --out-type=jpg --out-path="./jpg/" "$ARGUMENT" ; mv $ARGUMENT ./nef/ &
		pkill f-spot ; f-spot -f --basedir=$Today --view $ARGUMENT &
		
		;;
esac
