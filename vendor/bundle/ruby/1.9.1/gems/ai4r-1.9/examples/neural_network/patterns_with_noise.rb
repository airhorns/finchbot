# Author::    Sergio Fierens
# License::   MPL 1.1
# Project::   ai4r
# Url::       http://ai4r.rubyforge.org/
#
# You can redistribute it and/or modify it under the terms of 
# the Mozilla Public License version 1.1  as published by the 
# Mozilla Foundation at http://www.mozilla.org/MPL/MPL-1.1.txt
 
TRIANGLE_WITH_NOISE = [
  [ 1,  0,  0,  0,  0,  0,  0,  1,  5,  0,  0,  1,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  3,  0,  1,  9,  9,  1,  0,  0,  0,  0,  3,  0],
  [ 0,  3,  0,  0,  0,  0,  5,  1,  5,  3,  0,  0,  0,  0,  0,  7],
  [ 0,  0,  0,  7,  0,  1,  9,  1,  1,  9,  1,  0,  0,  0,  3,  0],
  [ 0,  0,  0,  0,  0,  3,  5,  0,  3,  5,  5,  0,  0,  0,  0,  0],
  [ 0,  1,  0,  0,  1,  9,  1,  0,  1,  1,  9,  1,  0,  0,  0,  0],
  [ 1,  0,  0,  0,  5,  5,  0,  0,  0,  0,  5,  5,  7,  0,  0,  3],
  [ 0,  0,  3,  3,  9,  1,  0,  0,  1,  0,  1,  9,  1,  0,  0,  0],
  [ 0,  0,  0,  5,  5,  0,  3,  7,  0,  0,  0,  5,  5,  0,  0,  0],
  [ 0,  0,  1,  9,  1,  0,  0,  0,  0,  0,  0,  1,  9,  1,  0,  0],
  [ 0,  0,  5,  5,  0,  0,  0,  0,  3,  0,  0,  0,  5,  5,  0,  0],
  [ 0,  1,  9,  1,  0,  0,  0,  0,  0,  0,  0,  0,  1,  9,  1,  0],
  [ 0,  5,  5,  0,  3,  0,  0,  3,  0,  0,  0,  0,  0,  5,  5,  0],
  [ 1,  9,  1,  0,  0,  3,  0,  0,  0,  1,  0,  0,  0,  1,  9,  1],
  [ 5,  5,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  5,  5],
  [10, 10, 10, 10,  1, 10, 10, 10, 10, 10,  1, 10, 10, 10, 10, 10]
]

SQUARE_WITH_NOISE = [
  [10,  3, 10, 10, 10,  6, 10, 10, 10, 10, 10,  4, 10, 10, 10, 10],
  [10,  0,  0,  0,  0,  7,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10],
  [10,  0,  3,  0,  0,  0,  0,  7,  0,  6,  1,  0,  0,  0,  0,  0],
  [10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10],
  [10,  0,  4,  0,  4,  0,  0,  0,  1,  0,  3,  0,  0,  4,  0, 10],
  [10,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0],
  [10,  0,  0,  0,  3,  6,  0,  0,  1,  0,  0,  0,  0,  0,  0, 10],
  [10,  0,  0,  0,  0,  0,  0,  4,  0,  0,  0,  0,  7,  0,  0, 10],
  [10,  4,  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10],
  [10,  0,  7,  0,  0,  3,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10],
  [10,  0,  0,  0,  0,  0,  0,  0,  3,  0,  0,  0,  0,  0,  7, 10],
  [10,  0,  3,  0,  4,  0,  0,  0,  0,  6,  0,  0,  0,  0,  0, 10],
  [10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0, 10],
  [10,  0,  0,  6,  0,  0,  0,  7,  0,  0,  0,  7,  0,  0,  0, 10],
  [10,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 10],
  [10, 10, 10, 10,  3, 10, 10, 10, 10,  0, 10, 10,  1, 10,  1, 10]
  
]

CROSS_WITH_NOISE = [
  [ 0,  0,  0,  0,  0,  0,  3,  3,  5,  0,  3,  0,  0,  0,  1,  0],
  [ 0,  1,  0,  0,  0,  1,  0,  5,  5,  0,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0,  0,  5,  5,  0,  0,  0,  3,  0,  0,  0],
  [ 0,  0,  1,  8,  0,  0,  0,  5,  5,  0,  4,  0,  0,  0,  1,  0],
  [ 0,  0,  0,  0,  0,  3,  0,  5,  0,  0,  0,  0,  1,  0,  0,  0],
  [ 0,  0,  0,  8,  0,  0,  0,  5,  5,  0,  0,  0,  0,  0,  0,  1],
  [ 0,  0,  0,  0,  0,  0,  0,  5,  5,  0,  3,  0,  0,  0,  0,  0],
  [ 5,  5,  5,  8,  5,  3,  5,  5,  5,  5,  5,  5,  5,  5,  0,  5],
  [ 5,  5,  5,  5,  5,  5,  5,  5,  1,  5,  5,  5,  5,  1,  0,  0],
  [ 0,  0,  0,  8,  0,  0,  0,  4,  5,  0,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0,  0,  5,  5,  4,  0,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  4,  0,  5,  5,  0,  0,  0,  0,  0,  0,  0],
  [ 4,  0,  0,  4,  0,  0,  0,  5,  5,  0,  0,  0,  1,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  1,  0,  5,  4,  4,  3,  0,  0,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0,  0,  5,  5,  0,  0,  0, 10,  0,  0,  0],
  [ 0,  0,  0,  0,  0,  0,  0,  5,  5,  0,  0,  0,  0,  0,  0,  0]
]
