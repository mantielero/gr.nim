import ../src/gr

# calcUpper
assert calcUpper(0.0) == 0.0
assert calcUpper(0.1) == 0.1
assert calcUpper(0.01) == 0.01
assert calcUpper(0.12) == 1.0
assert calcUpper(1.0) == 1.0
assert calcUpper(1.1) == 2.0
assert calcUpper(7.0) == 7.0
assert calcUpper(7.3) == 8.0
assert calcUpper(96.0) == 100.0
assert calcUpper(76.0) == 80.0
assert calcUpper(70.0) == 70.0
assert calcUpper(-10.0) == -10.0
echo calcUpper(-7.0)
assert calcUpper(-7.0) == -7.0
assert calcUpper(-6.8) == -6.0
# calcLower
assert calcLower(0.0) == 0.0
echo calcLower(1.0)
#assert calcLower(1.0) == 1.0
#assert calcLower(2.0) == 2.0