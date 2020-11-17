# title: "R130: Control"
# author: "정원혁, 2014"



# for ---------------------------------------------------------------------

for(i in 1:5) {
  print(i)
}

for(i in 1:5) 
  print(i)

for(i in 1:5)   print(i)

for(i in 1:5)   i   # 동작 않는다.

# 같은 동작, 다른 방법 
x <- c("a", "b", "c")

# 1
for(i in 1:3) {
  print(x[i])
}

# 2
for(i in seq_along(x)) {  #seq와 차이 검색해서 공부해보기
  print(x[i])
}

# 3
for(letter in x) {
  print(letter)
}

# 4
for(i in 1:3) print(x[i])


# 중첩 loop -----------------------------------------------------------------
x <- matrix(1:6, 2, 3)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  } 
}


# while -------------------------------------------------------------------
count <- 0
while(count < 4) {
  print(count)
  count <- count + 1
}


# if ----------------------------------------------------------------------

x <- c(1,2,3)
y <- c(4,5,6)
if (sum(x) < sum(y)) x
if (sum(x) > sum(y)) x


# if.. else/ ifelse -------------------------------------------------------
x <- c(1,2,-3)
y <- c(4,5,6)
if (sum(x) < sum(y)) x
if (sum(x) < sum(y)) print( 'Sx < Sy' ) else print( 'Sx > Sy' )
ifelse ( x>0, x, abs(x))



x <- c(6:-4); x
sqrt(x)  #- gives warning
sqrt(ifelse(x >= 0, x, NA))  # no warning

