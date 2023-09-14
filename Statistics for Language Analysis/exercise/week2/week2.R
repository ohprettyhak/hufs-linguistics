# R 기본 문법

# R 프로그래밍 언어에서 "객체(object)", “변수(variable), "함수(function)", "인수(argument)"의
# 개념의 이해하는 필수적이다.  이는 코드의 효율성, 가독성, 유지 보수성, 그리고 확장성을 높이는데
# 꼭 필요한 핵심 요소이기 때문이다.

# variable <- function (argument1, argument2)
x <- 42
y <- 'hello'

# 데이터의 종류
# integer
x <- 2L
typeof(x)

# double
y <- 2.5
typeof(y)

# complex
z <- 3 + 2i
typeof(z)

# character
a <- "Hello World"
typeof(a)

# logical
q1 <- TRUE
typeof(q1)

q2 <- FALSE
typeof(q2)


# Vector (벡터)
# 벡터 (Vector): 벡터는 같은 타입의 데이터를 일렬로 저장한 데이터 구조를 말한다.
numeric_vector <- c(1, 2, 3)
character_vector <- c("apple", "banana", "cherry")
logical_vector <- c(TRUE, FALSE, TRUE)

# 벡터 생성 (Assignment)
x <- c(1, 2, 3, 4, 5)

# 벡터 내용 확인
print(x)

# 벡터끼리의 계산
y <- c(5, 4, 3, 2, 1)
sum_xy <- x + y
print(sum_xy)

# 벡터 결합
combined_vector <- c(x, y)
print(combined_vector)


# 행렬 (Matrix): 행렬은 2차원 배열로, 모든 원소가 같은 형태를 가지고 있어야 한다.

my_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)

# 행렬 생성 (Assignment)
m <- matrix(c(1, 2, 3, 4), nrow = 2)

# 행렬 내용 확인
print(m)


#==============================================================================
# 연습 문제 1
#==============================================================================
# 1) 숫자 10을 저장하는 변수를 생성하세요.
# 2) 문자열 "hello world"를 저장하는 변수를 생성하세요.
# 3) 논리값 TRUE를 저장하는 변수를 생성하세요.
# 4) 복소수 3 + 4i를 저장하는 변수를 생성하세요.
# 5) 정수형 7을 저장하는 변수를 생성하세요.
# 6) 숫자 20과 문자열 "R"을 저장하는 두 개의 변수를 생성하세요.
# 7) 논리값 FALSE와 정수형 100을 저장하는 두 개의 변수를 생성하세요.
# 8) 숫자 5, 10, 15를 저장하는 벡터를 생성하세요.
# 9) 문자열 "apple", "banana", "cherry"를 저장하는 벡터를 생성하세요.
# 10) 논리값 TRUE, FALSE, TRUE를 저장하는 벡터를 생성하세요.

ed <- 10  # 1
es <- "hello world"  # 2
eb <- TRUE  # 3
ec <- 3 + 4i  # 4
ei <- 7L  # 5
ed2 <- 20; es2 <- "R"  # 6
eb2 <- FALSE; ei2 <- 100L  # 7
iv <- c(5, 10, 15)  # 8
sv <- c("apple", "banana", "cherry")  # 9
bv <- c(TRUE, FALSE, TRUE)  # 10


# 데이터 프레임 (Data Frame): 데이터 프레임은 2차원 테이블 구조로, 열(column)별로 다른 타입의 데이터를 저장할 수 있다.
# 주로 통계 분석이나 데이터 처리를 위해 사용된다.

my_data_frame <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Salary = c(50000, 60000, 70000)
)

# 리스트 (List): 리스트는 다양한 타입과 구조의 데이터를 저장할 수 있는 복합 데이터 타입이다.
# 리스트 안에는 벡터, 행렬, 데이터 프레임, 다른 리스트 등이 포함될 수 있다.

my_list <- list(
  name = "Alice",
  age = 25,
  scores = c(90, 85, 88),
  is_female = TRUE
)

my_list2 <- list(
  name = c("Alice", "Bob", "Charlie"),
  age = c(25, 30, 35),
  salary = c(50000, 60000, 70000)
)


# R 프로그래밍과 관련해서 가장 기초가 되는 오브젝트 (object variable)에 대입 (assignment)를 학습.
# 변수에 대입 (assignment)

x <- 2

# 숫자 (Numeric): R에서 숫자는 실수나 정수를 구분한다.
# 디폴트로 숫자는 실수 형태로 저장되며, 정수를 명시적으로 표현하기 위해서는 L을 붙여 사용한다.

# 실수
x <- 42.0

# 정수
y <- 42L

# 단순 연산
# R에서의 사칙연산 예시: R에서 사칙연산은 기본적인 수학 연산자를 사용하여 수행 가능
# 뺄셈
5 - 3
sub_result <- 5 - 3
sub_result

# 곱셈
5 * 3
mul_result <- 5 * 3
mul_result

# 나눗셈
5 / 3
div_result <- 5 / 3
div_result

# 몫
5 %/% 3
quot_result <- 5 %/% 3
quot_result

# 나머지
5 %% 3
mod_result <- 5 %% 3
mod_result

# 나누셈 (몫과 나머지 표시)
result <- c(`quotient(몫)` = 5 %/% 3, `remainder(나머지)` = 5 %% 3)


#==============================================================================
# 연습 문제 2
#==============================================================================
# 1) 덧셈 퀴즈: 23 + 37의 결과는 얼마인가요?
# 2) 뺄셈 퀴즈: 45 - 19의 결과는 얼마인가요?
# 3) 곱셈 퀴즈: 8 * 6의 결과는 얼마인가요?
# 4) 나눗셈 퀴즈: 32 / 4의 결과는 얼마인가요?
# 5) 몫 퀴즈: 35 %/% 6의 결과는 얼마인가요?
# 6) 나머지 퀴즈: 35 %% 6의 결과는 얼마인가요?
# 7) 복합 퀴즈: (23 + 37) * 2 - 45의 결과는 얼마인가요?
# 8) 복합 퀴즈 2: (10 %/% 3) * 2 + (10 %% 3)의 결과는 얼마인가요?

23 + 37  # 1
45 - 19  # 2
8 * 6  # 3
32 / 4  # 4
35 %/% 6  # 5
35 %% 6  # 6
(23 + 37) * 2 - 45  # 7
(10 %/% 3) * 2 + (10 %% 3)  # 8


# ========================================

# 문자 (Character): 문자는 텍스트 데이터를 다루기 위한 형식이다.
# 문자 데이터는 따옴표(" ") 또는 작은 따옴표(' ')로 묶어 표현하며, 문자열은 텍스트 처리, 문자열 연결, 문자열 분할 등에 사용된다.

# 문자열
name <- "HAK"
greeting <- 'Hello, World!'
back_number <- "7"

# R에서 문자열을 다루는 여러 가지 방법이 있으며. 아래가 가장 기본적인 예시라고 할 수 있다.

# 문자열 생성:
my_string <- "Hello, World!"

# 문자열 연결:
greeting <- "Hello,"
name <- "HAK"
full_greeting <- paste(greeting, name)
print(full_greeting)

# 문자열 길이 확인
length_of_string <- nchar("Hello, HAK")
print(length_of_string)

# 문자열 분할
split_string <- strsplit("Hello, HAK", split = ", ")
print(split_string)

# 문자열 대소문자 변환
upper_case <- toupper("Hello")
lower_case <- tolower("HAK")
print(upper_case)
print(lower_case)

# 문자열 부분 추출
substring("Hello, World!", 1, 5)

# 문자열 교체
gsub("cats", "dogs", "I love cats")


#==============================================================================
# 연습 문제 3
#==============================================================================

# 1) 문자열 연결: "R"과 "Programming"을 연결하여 "R Programming"이라는 문자열을 만들어보세요.
# 2) 문자열 길이 확인: "Data Science"라는 문자열의 길이는 얼마인가요?
# 3) 문자열 분할: "apple,banana,orange"라는 문자열을 쉼표(,)를 기준으로 분할해보세요.
# 4) 대소문자 변환: "CaseSensitive"라는 문자열을 모두 대문자로 변환해보세요. 그리고 모두 소문자로 변환해보세요.
# 5) 문자열 부분 추출: "abcdefgh"에서 "cdef"라는 부분 문자열을 추출해보세요.
# 6) 문자열 교체: "I love cats"라는 문자열에서 "cats"를 "dogs"로 교체해보세요.

paste("R", "Programming")  # 1
nchar("Data Science")  # 2
strsplit("apple,banana,orange", split = ",")  # 3
toupper("CaseSensitive"); tolower("CaseSensitive")  # 4
substring("abcdefgh", 3, 6)  # 5
gsub("cats", "dogs", "I love cats")  # 6


# 논리값은 TRUE 또는 FALSE 중 하나의 값을 가진다. 이러한 논리값은 조건문, 논리 연산, 필터링 등에 사용된다.
# 논리값
is_true <- TRUE
is_false <- FALSE
# 논리값은 주로 비교 연산(==, !=, <, >, <=, >=)의 결과로도 나타난다.
42 > 40  # TRUE
42 == 40 # FALSE

#논리값 생성
a <- TRUE
b <- FALSE
#논리 연산
# AND 연산
result_and <- a & b
print(paste("TRUE AND FALSE =", result_and))

# OR 연산
result_or <- a | b
print(paste("TRUE OR FALSE =", result_or))

# NOT 연산
result_not <- !a
print(paste("NOT TRUE =", result_not))

# 논리값 비교
is_equal <- (a == b)
print(paste("TRUE == FALSE :", is_equal))

# 조건문에서의 사용
if (a) {
  print("a is TRUE")
} else {
  print("a is FALSE")
}


# while 루프
# "while 반복문"이라는 것은 어떤 조건이 참(true)인 동안 계속해서 동일한 일을 반복하는 프로그래밍 구조이다.
# 이것은 일상 생활에서도 자주 볼 수 있는데, 예를 들어, "손이 깨끗해질 때까지 계속해서 손을 씻는다"라고 할 수 있다.
# 알아야 하는 이유는 프로그램에서 반복문(루프)이 중요하다.

while (FALSE) {
  print("Hello")
}

# 무한루프
# while (TRUE) {
#   print("Hello")
# }

# 카운터 반복문
counter <- 1
while (counter < 12) {
  print(counter)
  counter <- counter + 1
}

# 신호등의 색깔을 초기화. ("red"로 설정)
traffic_light <- "red"

# 신호등이 초록색이 될 때까지 대기.
while (traffic_light != "green") {
  # 기다려야 한다는 메시지를 출력.
  print("You have to wait. The traffic light is not green yet.")

  # 예시를 위해 신호등이 노란색으로 바뀐다고 가정.
  traffic_light <- "yellow"

  # 신호등이 노란색이면 조심해야 한다는 메시지를 출력.
  if (traffic_light == "yellow") {
    print("Be careful. The traffic light is yellow.")
  }

  # 예시를 위해 신호등이 초록색으로 바뀐다고 가정.
  traffic_light <- "green"
}

# 신호등이 초록색이면 건널 수 있다는 메시지를 출력.
print("You can cross now! The traffic light is green.")


# for loop 반복문
# "for 반복문"은 특정 횟수만큼 같은 작업을 반복하고 싶을 때 사용하는 프로그래밍 구조이다.
# 예를 들어, "사과 5개를 바구니에 담는다"라고 생각해보자. 각 사과를 하나씩 바구니에 담는 작업을 5번 반복하면 된다.

for (i in 1:5) {
  print("Hellow World")
}

1:5

for (i in 5:10) {
  print("Hellow World")
}

# 예시: 친구들에게 초대장을 나눠주기
# 상상해보세요. 친구들 5명에게 생일 파티 초대장을 나눠주려고 합니다.
# 각각의 친구에게 하나씩 초대장을 주면 됩니다. 이걸 프로그래밍으로 어떻게 표현할 수 있을까요.

# 초대할 친구들의 이름 리스트
friend_names <- c("John", "Emily", "Sophia", "Michael", "Grace")

# 각 친구에게 초대장을 주기
for (friend in friend_names) {
  print(paste("You are invited to my birthday party,", friend))  # 초대장을 주는 작업을 표현
}


# "if 문"은 어떤 조건이 참인지 아닌지에 따라 다른 작업을 하고 싶을 때 사용하는 프로그래밍 구조이다.
# 예를 들어, "밖에 비가 오면 우산을 들고 나가고, 그렇지 않으면 그냥 나간다"와 같은 경우이다.

#---- -2 ---- -1 ---- 0 ---- 1 ---- 2 ----

# 난수 생성
rnorm(1)
answer <- ""

x <- rnorm(1)

if (x > 1) {
  answer <- "It is Greater than 1"
}

paste(answer, x)

#====================================

x <- rnorm(1)
answer <- ""

if (x > 1) {
  answer <- "It is Greater than 1"
} else {
  answer <- "It is lesser or equal to 1"
}
paste(answer, x)

#====================================

x <- rnorm(1)
answer <- ""

if (x > 1) {
  answer <- "It is Greater than 1"
} else {
  if (x >= -1) {
    answer <- "It is lesser or equal to 1"
  } else {
    answer <- "Lesser than -1"
  }
}
paste(answer, x)

#===========================================

# else 와 if가 반복되는 문법은 좋지 않음 따라서 Chaining Statement로

x <- rnorm(1)
answer <- ""

if (x > 1) {
  answer <- "It is Greater than 1"
} else if (x >= -1) {
  answer <- "It is between -1 and 1"
} else {
  answer <- "Lesser than -1"
}
paste(answer, x)

# 처럼 코드를 줄일 수 있음.

#===========================================

# 예시: 우산 챙기기 결정하기
# 상상해보세요. 집을 나가기 전에 창문 밖을 보니까 날씨가 어둡습니다. 이제 우산을 챙길지 말지 결정해야 해요.

# 밖에 비가 오면: 우산을 챙깁니다.
# 밖에 비가 오지 않으면: 우산을 챙기지 않습니다.

# 이걸 프로그래밍으로 어떻게 표현할 수 있는지 살펴봅시다.

# 밖에 비가 오는지 여부 (TRUE: 오고 있음, FALSE: 오고 있지 않음)

is_raining <- TRUE
# 밖에 비가 오면 우산을 챙기고, 그렇지 않으면 그냥 나간다.
if (is_raining) {
  print("It's raining. Take an umbrella.")
} else {
  print("It's not raining. You don't need an umbrella.")
}

# 이 코드에서는 if 문을 사용하여 is_raining이 TRUE (비가 오고 있다)인지 아닌지를 확인한다.
# TRUE라면 "It's raining. Take an umbrella."라고 출력하고,
# 그렇지 않으면 "It's not raining. You don't need an umbrella."라고 출력


# R에서 기술 통계 (Descriptive Statistics)를 작성하기 위해 평균 (mean), 중앙값(median),
# 분산(variance), 표준편차(Standard Deviation), 최소값과 최대값 (min & max)
# 그리고 요약에 대한 이해 및 기술 통계를 이용하기 위한 원 툴 (One Tool)을 추가로 소개

# 벡터에 대한 기술통계
# 평균 (Mean)
x <- c(1, 2, 3, 4, 5)
mean_x <- mean(x)
mean_x

# 중앙값 (Median)
median_x <- median(x)
median_x

# 분산 (Variance) 과 표준편차 (Standard Deviation)
var_x <- var(x)
var_x
sd_x <- sd(x)
sd_x

# 최소값 (Min)과 최대값 (Max)
min_x <- min(x)
min_x
max_x <- max(x)
max_x

# 요약(Summary)
summary_x <- summary(x)
summary_x


#==============================================================================
# 연습 문제 4
#==============================================================================
# 1) 벡터 a <- c(10, 20, 30, 40, 50)의 평균과 중앙값을 구하라.
# 2) 벡터 a의 분산과 표준편차를 구하라
# 3) 벡터 a의 최솟값과 최댓값을 구하라
# 4) 행렬 mat <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)의 각 열의 평균을 구하라.
# 변수와 데이터 타입
# 5) 두 개의 정수형 변수를 생성하고, 두 변수의 곱을 저장하는 새로운 변수를 작성하라.
# 예: x <- 3, y <- 4, z <- x * y
# 6) 두 개의 문자열을 연결해서 새로운 문자열을 만드는 변수를 생성하라.
# 예: str1 <- "Hello", str2 <- "World", new_str <- paste(str1, str2)
# 7) 숫자 5, 10, 15, 20, 25를 저장하는 벡터를 생성하고, 벡터의 길이를 확인하라.
# length() 함수 사용
# 8) 논리값 TRUE, FALSE, TRUE, FALSE를 저장하는 벡터를 생성하고, all() 함수를 사용하여 모든 값이 TRUE인지 확인하세요.
# 데이터 프레임
# 9) 이름, 나이, 성별을 열로 가지는 데이터 프레임을 생성하세요.
# data.frame() 함수 사용
# 조건문과 반복문
# 10) 1부터 10까지의 숫자 중에서 짝수만 출력하는 for 반복문을 작성하라.
# for loop와 if statement 사용
# 11) 논리값 변수가 TRUE일 경우 "It is true!"를, FALSE일 경우 "It is false!"를 출력하는 if-else 문을 작성하라.
# if-else statement 사용
# 기초 통계
# 12) 주어진 숫자 벡터의 중앙값이 평균보다 큰지 확인하는 코드를 작성하라.
# mean()과 median() 함수 사용

a <- c(10, 20, 30, 40, 50)
mean(a); median(a)  # 1
var(a); sd(a)  # 2
max(a); min(a)  # 3
mat <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2)
mean(mat[1]); mean(mat[2])  # 4
x <- 3; y <- 4; z <- x * y  # 5
str1 <- "Hello"; str2 <- "World"; new_str <- paste(str1, str2)  # 6
b <- c(5, 10, 15, 20, 25); length(b)  # 7
bo <- c(TRUE, FALSE, TRUE, FALSE); all(bo)  # 8
df <- data.frame(Name = c("Hak", "Lee"), Age = c(25, 30), Gender = c("Male", "Female")); print(df) # 9
for (i in 1:10) if (i %% 2 == 0) print(i)  # 10
if (a[1] == 10) print("It is true!") else print("It is false!")  # 11
if (mean(b) > median(b)) print("mean greater then median") else print("median greater then mean")  # 12


# R 패키지 사용법
# R 패키지(package)는 R에서 사용할 수 있는 함수, 데이터 세트, 문서 등을 묶어 놓은 것을 말한다.
# 패키지는 R의 기능을 확장하는 주요한 방법 중 하나로, 통계 분석, 데이터 시각화, 데이터 처리,
# 머신러닝 등 다양한 분야에서 사용된다.

# 패키지의 주요 구성요소는 다음과 같다.
# • 함수(Function): 특정 작업을 수행하는 코드의 묶음
# • 데이터 세트(Data set): 예제 또는 실습을 위한 데이터
# • 문서(Documentation): 패키지와 그 내부의 함수, 데이터 세트 등에 대한 설명
# • 메타데이터(Metadata): 패키지 버전, 의존성 등에 대한 정보

# R에서 주요하게 사용되는 패키지는 아래와 같다.
# • ggplot2: 고급 데이터 시각화를 위한 패키지
# • dplyr: 데이터 처리를 위한 패키지
# • tidyr: 데이터 정리를 위한 패키지
# • lubridate: 날짜와 시간을 다루는 패키지
# • stringr: 문자열 처리를 위한 패키지
# • caret, xgboost, randomForest: 머신러닝을 위한 패키지
# • shiny: 웹 앱을 만들기 위한 패키지

# 패키지 사용 방법
# 설치(Installation): 패키지를 처음 사용할 때는 한번 꼭 설치해야 한다.

install.packages("tidyverse")

# 불러오기(Load): 설치된 패키지를 사용하기 위해서는 라이브러리를 불러와야 한다.
library(tidyverse)

# 함수 사용(Usage): 패키지가 불러와지면 해당 패키지의 함수를 사용할 수 있다.

library(ggplot2)

data <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(5, 4, 3, 2, 1)
)

# ggplot2 패키지를 이용해 그래프 그리기
p <- ggplot(data, aes(x = x, y = y))
p <- geom_point()


# Excel 데이터 사용
# $을 입력하면 헤더를 가져와 사용할 수 있다.
mean(OLS_Sample$Sentiment)