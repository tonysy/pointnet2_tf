import os
import sys

import tensorflow as tf 
include_path = tf.sysconfig.get_include()
lib_path = tf.sysconfig.get_lib()

os.system('sh ./build.sh {} {}'.format(include_path, lib_path))