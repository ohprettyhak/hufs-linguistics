#-----------------------------------
# 1. 패키지 설치와 라이브러리 로딩
#-----------------------------------
# install.packages는 패키지를 설치하는 함수이다.
# library는 설치된 패키지를 로드하여 사용할 수 있게 하는 함수 (function)이다.

# quanteda 패키지를 설치.
# install.packages("quanteda")
# install.packages("quanteda.textstats")
# 라이브러리를 로드.

library(tidyverse)
library(quanteda)
library(quanteda.textstats)
library(quanteda.textmodels)
library(quanteda.textplots)
library(seededlda)
library(SnowballC)
library(tidytext)
library(spacyr)
library(readxl)
library(stringi)

# Coding Quiz 3-1
# 1) ggplot2 패키지 설치
# 2) 설치한 패키지를 로드하는 코드 작성

# install.packages("ggplot2")
library(ggplot2)

#-----------------------------------
# 개념 설명
#-----------------------------------

#=========================================================
# 코퍼스 (Corpus)란 무엇인가?
#=========================================================
# 코퍼스(Corpus)는 원본 문서의 저장하는 일종의 "도서관"으로 인식하면 된다.
# 즉 하나는 모든 데이터를 의미할 수도 있으며, 경우에 따라서는 개별 문서 문서가 되기도 한다.
# 데이터 프레임은 다양한 타입의 열을 가질 수 있는 2차원 데이터 구조이지만,
# 코퍼스는 텍스트 데이터와 그에 대한 메타데이터만을 가지고 있다.
# 텍스트 데이터를 코퍼스로 변환하는 이유로,
# 코퍼스로 변환하면 텍스트 데이터를 쉽게 관리하고 분석할 수 있다.

# 텍스트 샘플

txt1 <- c(text1 = "The harder you work, the more likely you can reach the goal.",
          text2 = "I don't want a perfect life, I want a happy life.",
          text3 = "Only I can change my life, no one can do it for me.",
          text4 = "Life is like a box of chocolates, You never know what you're gonna get.",
          text5 = "Hankuk university of foreign studies, #HUFS, https://hufs.ac.kr")
print(txt1)

# 코퍼스로 하나로 묶기
txt1 <- corpus(txt1)
print(txt1)

# 코퍼스로 하나로 묶기 : 문자만 들어 있으면 여전히 문자이다.
typeof(txt1)  # character (캐릭터 덩어리, 문자 덩어리)


# Error: Cannot combine corpora with duplicated document names
#Show stack trace
# txt2 <- c(text1 = "Happiness is a warm puppy.",
#           text2 = "Don't give up easily even if you failed.",
#           text3 = "United we stand, divided we fail",
#           text4 = "Life is all about timing.",
#           text5 = "Quanteda, #Quanteda, https://quanteda.io")
# txt2 <- corpus(txt2)
# txt3 <- c(txt1, txt2)

# 코퍼스를 합치거나 할 수 있지만 속에 있는 작은 코퍼스는 이름이 중복되지 않아야 한다.
txt2 <- c(text6 = "Happiness is a warm puppy.",
          text7 = "Don't give up easily even if you failed.",
          text8 = "United we stand, divided we fail",
          text9 = "Life is all about timing.",
          text10 = "Quanteda, #Quanteda, https://quanteda.io")
txt2 <- corpus(txt2)
txt3 <- c(txt1, txt2)
print(txt3)

#=========================================================
# 토큰화
#=========================================================

# 코퍼스가 이루어 졌으면 토큰화(Tokenization)가 필요하다.
# 토큰화란입력 문서를 더 작은 단위인 토큰으로 분리하는 과정 즉 단어로 쪼개는 과정을 의미한다.
# 더 나아가 Quanteda는 각 입력 문서에 대응하는 문자 벡터 형태의 토큰 리스트를 중간 객체로 생성한다.

tokens(txt3)
txt3 <- stri_replace_all_regex(txt3, "#\\w+", "")
print(txt3)

# 데이터 클랜징
# %>% 연결어, R 문법 (txt3.tokens에 대해 이어서 코드 작성 의미)
txt3.tokens <- tokens(txt3, what = "word",
                      remove_numbers = TRUE,
                      remove_punct = TRUE,
                      remove_symbols = TRUE,
                      split_hyphens = TRUE,
                      remove_url = TRUE) %>%
  tokens_remove(stopwords("en")) %>%
  tokens_tolower(keep_acronyms = FALSE) %>%
  tokens_wordstem("english") %>%
  tokens_remove(pattern = "#")  # Remove isolated hashtags

print(txt3.tokens)


#=========================================================
# document feature matrix (dfm)를 통한 bag-of-words 작성
#=========================================================

# Document Feature Matrix (dfm)와 Bag-of-words 모델은 텍스트 마이닝과
# 자연어 처리 분야에서 핵심적인 역할을 하고 있다.
# dfm은 문서와 특성(대부분은 단어) 간의 관계를 행렬 형태로 표현하며,
# 이를 통해 각 단어의 빈도수를 쉽게 파악할 수 있다
# 이러한 구조는 복잡한 텍스트 데이터를 분석가능한 형태로 단순화할 수 있다.
# Bag-of-words 모델은 단순하지만 강력한 텍스트 데이터 표현 방법으로,
# 단어의 순서나 문맥을 무시하고 단어의 빈도에만 집중한다.
# 이 두 방법은 머신 러닝 알고리즘에 쉽게 통합될 수 있어, 문서 분류나 군집화,
# 주제 모델링 등 다양한 분석에 활용된다.

txt3.dfm <- dfm(txt3.tokens)
print(txt3.dfm)


#=========================================================
# TF-IDF 구하기
#=========================================================

# TF-IDF (Term Frequency-Inverse Document Frequency)는 텍스트 분석과 자연어
# 처리에서 중요한 역할을 하는 가중치 부여 방법이다.
# 이 방법은 각 단어의 중요성을 평가하기 위해 빈도수와 문서 분포를 동시에 고려한다.
# 이러한 접근법은 단순한 단어 빈도수 분석이 갖는 한계를 극복하고,
# 텍스트 데이터 내에서 상대적으로 중요한 단어를 식별할 수 있게 해준다.
# 또한, TF-IDF는 머신 러닝 알고리즘에도 쉽게 적용될 수 있어,
# 문서 분류, 군집화, 추천 시스템 등 다양한 분야에서 활용된다.
# 이 방법은 특히 크고 복잡한 텍스트 데이터셋을 분석할 때 유용하며,
# 효과적인 특성 추출을 가능하게 한다.
# 이를 통해 텍스트 데이터의 차원을 축소하고, 더 정확하고 효율적인 분석이 가능하다.

txt3.tokens.tfidf <- dfm_tfidf(txt3.dfm)
print(txt3.tokens.tfidf)


#==================
#Coding Quiz 3-2
#==================

# 1) txt1과 txt2를 합쳐 txt3을 만드는 코드를 작성
# 2) txt3에서 특수 문자와 숫자를 제거한 토큰을 생성
# e.g) txt1.tokens <- tokens(txt1, what = "word", remove_numbers = TRUE, remove_punct = TRUE)
# 3) txt3.tokens에서 불용어를 제거
# e.g) txt1.tokens <- tokens_remove(txt1.tokens, stopwords("en"))
# 4) txt3을 토큰화한 후, 모든 토큰을 소문자로 변환

# 1) text1과 text2를 합쳐 text3을 만드는 코드 작성
text1 <- c(text1 = "The harder you work, the more likely you can reach the goal.",
           text2 = "I don't want a perfect life, I want a happy life.",
           text3 = "Only I can change my life, no one can do it for me.",
           text4 = "Life is like a box of chocolates, You never know what you're gonna get.",
           text5 = "Hankuk university of foreign studies, #HUFS, https://hufs.ac.kr")
text1 <- corpus(text1)
text2 <- c(text6 = "Happiness is a warm puppy.",
           text7 = "Don't give up easily even if you failed.",
           text8 = "United we stand, divided we fail",
           text9 = "Life is all about timing.",
           text10 = "Quanteda, #Quanteda, https://quanteda.io")
text2 <- corpus(text2)
text3 <- c(text1, text2)
print(text3)

# 2) text3에서 특수 문자와 숫자를 제거한 토큰을 생성
text3.tokens <- tokens(text3, what = "word",
                       remove_numbers = TRUE,
                       remove_punct = TRUE,
                       remove_symbols = TRUE,)
print(text3.tokens)

# 3) text3.tokens에서 불용어를 제거
text3.tokens <- tokens_remove(text3.tokens, stopwords("en"))
print(text3.tokens)

# 4) text3을 토큰화한 후, 모든 토큰을 소문자로 변환
text3.tokens <- tokens_tolower(text3.tokens, keep_acronyms = FALSE)

# =======================================
# 빈도 분석
# =======================================

# This section creates a graph of the 50 most frequent words in the corpus.

txt3.freq <- textstat_frequency(txt3.dfm, n = 50)  # 50개 까지만
print(txt3.freq)

# Sort by reverse frequency order
txt3.freq$feature <- with(txt3.freq, reorder(feature, -frequency))

ggplot(txt3.freq, aes(x = feature, y = frequency)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

frequency.table <- txt3.freq


#=========================================================
# 워드 클라우드
#=========================================================

# 워드 클라우드는 텍스트 데이터에서 가장 자주 등장하는 단어를 시각적으로 표현한다.
# 크기, 색상, 위치 등을 다르게 해서 단어의 빈도나 중요성을 나타낸다.
# 이 방법은 빠르게 텍스트의 주요 키워드를 파악하거나 문서 집합의 주제를 이해하는 유용
# 하지만 빈도만을 기반으로 하기 때문에 문맥이나 단어 간 관계는 고려하지 않음.

#-----------------------------------
# 워드 클라우드 생성
#-----------------------------------
# 'textplot_wordcloud()' 함수를 사용하여 워드 클라우드를 생성한다.
# dfm 객체(txt3.dfm)을 이용해 워드 클라우드를 그린다.

textplot_wordcloud(txt3.dfm, max_words = 100,
                   color = "darkblue",
                   random_order = FALSE,
                   rotation = 0.25)


#=========================================================
# 문서의 유사도 분석 [코사인 유사도(cosine similarity)]
#=========================================================

# 코사인 유사도(cosine similarity)는 두 텍스트 문서가 얼마나 유사한지를 판단하는데
# 사용되는 측정 방법이다. 이 방법은 두 문서를 고차원의 벡터 공간에 투영한 후,
# 두 벡터 간의 각도를 계산하여 유사성을 측정한다.
# 코사인 유사도 값은 -1부터 1까지 범위를 가지며, 값이 1에 가까울수록 두 문서는
# 유사하다고 판단할 수 있다.텍스트 마이닝에서 이 방법은 문서 분류, 클러스터링,
# 추천 시스템 등 다양하게 활용된다.
# textstat_simil() 함수를 사용하면 txt3.dfm이라는 문서-특징 행렬(dfm)에 대한
# 코사인 유사도를 쉽게 계산할 수 있다.
# 결과로 반환되는 유사도 행렬은 각 문서 쌍 간의 유사도를 나타낸다.


# 코사인 유사도를 계산하여 유사도 행렬을 생성
similarity_matrix <- textstat_simil(txt3.dfm, method = "cosine")
# 유사도 행렬을 출력
print(similarity_matrix)


#=========================================================
# 감정 분석(sentiment analysis)
#========================================================
# 감정 분석(sentiment analysis)은 텍스트에서 긍정적이거나 부정적인 감정을
# 파악하는 프로세스이다. 여기에서는 간단한 어휘 기반(lexicon-based) 방법을
# 사용하여 각 문서의 감정 점수를 계산한다. 어휘는 각 단어와 그에 해당하는
# 감정 점수를 포함한 데이터 프레임으로 구성한다.
# 예를 들어, "happy"라는 단어는 점수 1을, "sad"는 점수 -1을 가진다.
# dfm_lookup() 함수를 사용하여 txt3.dfm 문서-특징 행렬에 포함된 각 단어의 감정 점수를 계산한다.
# 결과로 나오는 txt3_sentiment는 각 문서의 총 감정 점수를 나타낸다.

# 감정 점수 어휘를 로드
lexicon <- data.frame(word = c("happy", "sad", "good", "bad"),
                      score = c(1, -1, 1, -1))

# 데이터 프레임을 dictionary 객체로 변환
lexicon_dict <- dictionary(list(score = lexicon$word))
print(lexicon_dict)

# 감정 점수를 계산
txt3_sentiment <- dfm_lookup(txt3.dfm, lexicon_dict)

# 계산된 감정 점수를 출력
print(txt3_sentiment)


#=========================
# N-gram
#=========================

# n-gram은 텍스트 데이터 내에서 연속적으로 나타나는 n개의 아이템(보통 단어)을 의미한다.
# 예를 들어, "I am happy"라는 문장에서 bigram(2-gram)은 "I am", "am happy"가 될 것이다.
# 이러한 n-gram은 텍스트 분석에서 문맥을 더 잘 이해하거나 특정 패턴을 찾는 데 유용합니다.
# 본 예제에서는 tokens_ngrams() 함수를 사용하여 주어진 텍스트 데이터(txt3.tokens)에서
# bigram과 trigram을 생성한다.
# 이를 통해 텍스트의 구조와 패턴을 더 복잡하게 분석할 수 있다.

# n-gram란? : # n-gram은 텍스트에서 연속적으로 나타나는 n개의 아이템(주로 단어)을 의미한다.
# n-gram은 어떻게 유용한가: n-gram은 문맥의 중요성을 반영하여 텍스트 분석의 정확성을 높이거나 특정 패턴을 찾는 데 유용하다.

# n-gram 생성
# n = 2:3을 설정하여 bigram과 trigram을 생성
txt3_ngrams <- tokens_ngrams(txt3.tokens, n = 2:3)
# 생성된 n-grams을 출력
print(txt3_ngrams)


#=========================
# 나이브 베이즈 분류기
#=========================
# 텍스트 분류란 무엇인가?
# 텍스트 분류는 텍스트 문서를 미리 정의된 카테고리에 자동으로 할당하는 과정이다.
# 나이브 베이즈 알고리즘이란?
# 나이브 베이즈는 조건부 확률을 기반으로 빠르고 효율적으로 텍스트를 분류하는 알고리즘이다.
# 텍스트 분류의 활용 분야는 어떤 것이 있나?
# 스팸 필터링, 감정 분석, 문서 분류 등 다양한 분야에서 활용된다.
# 텍스트 분류를 위해 사용할 수 있는 다른 알고리즘은 어떤 것이 있나?
# 서포트 벡터 머신(SVM), 랜덤 포레스트, 로지스틱 회귀 등 다양한 알고리즘이 있다.

# 훈련 레이블을 생성
train_labels <- factor(c("positive", "negative", "positive", "neutral"))
# 나이브 베이즈 모델 훈련
nb_model <- textmodel_nb(txt3.dfm, y = train_labels)
# 새로운 데이터에 대한 예측 수행
predict(nb_model, newdata = txt3.dfm)


#=========================================================
# 공기어(동시에 일어나는 언어, 같이 발생되는 단어) 분석
#=========================================================

# 공기어 분석은 텍스트 데이터의 단어나 구문이 어떻게 함께 등장하는지를 조사하는 중요한 기법이다.
# 이 방법은 문맥적 의미와 텍스트의 주제를 더 정확하게 파악하는 데 도움이 준다.
# 빈도 분석과 통계적 검증을 통해, 중요한 단어나 구문의 관계를 정량적으로 평가할 수 있으며,
# 이러한 분석은 검색 엔진 최적화, 감성 분석, 기계 번역 등 다양한 자연어 처리 응용에서 활용 가능하다.

txt3.dfm.Network <- fcm(txt3.dfm)
txt3.dfm.Network <- fcm(txt3.dfm, tri = FALSE)  # Create Co-occurrence Network
feat <- names(topfeatures(txt3.dfm.Network, 50))  # Select most frequent Co-occurrence corpuses
set.seed(100)
txt3.dfm.Network <- fcm_select(txt3.dfm.Network, pattern = feat, verbose = FALSE)

# CON 그리기
textplot_network(txt3.dfm.Network, min_freq = 0.95,
                 edge_alpha = 0.8,
                 edge_size = 0.5)


#=========================================================
# lda 기반의 토픽 분석
#=========================================================

# Latent Dirichlet Allocation (LDA)는 텍스트 데이터에서 숨겨진 '토픽'을 찾아내는 비지도 학습 방법이다.
# 이 기법은 대규모 텍스트 데이터를 효과적으로 요약하고 구조화하는데 사용되며,
# 문서 분류, 추천 시스템, 감시 및 모니터링 등 다양한 분야에서 응용된다.
# LDA는 각 문서가 여러 토픽의 혼합으로 이루어져 있음을 가정하고,
# 이를 바탕으로 단어의 확률 분포에 따라 토픽을 추출한다.
# 이러한 토픽 추출은 문서의 복잡성을 줄이고, 주제를 더 명확하게 이해하는 데 도움을 준다.
# LDA는 레이블이 없는 데이터에서도 효과적으로 작동하므로, 자연어 처리와 텍스트 마이닝에서 광범위하게 활용된다.
# 비 지도학습

tmod_lda <- textmodel_lda(txt3.dfm, k = 3)
terms(tmod_lda, 5)


#=============================================
# 환경 (Environment)를 청소하고 다시 시작
#=============================================

#-----------------------------------
# 1. 라이브러리를 로드.
#-----------------------------------

library(tidyverse)
library(quanteda)
library(quanteda.textstats)
library(quanteda.textmodels)
library(quanteda.textplots)
library(seededlda)
library(SnowballC)
library(tidytext)
library(spacyr)
library(readxl)
library(stringi)


#-----------------------------------
# 2. 데이터 로딩
#-----------------------------------

# Excel 파일을 읽어오기
news.source <- read_xlsx(file.choose())
# CSV 파일을 읽어오기
# news.source <- read.csv(file.choose())
# TXT 파일을 읽어오기
# library(readtext)
#news.source <- readtext::(file.choose())

# 데이터를 corpus 객체화한다.
news.corpus <- corpus(news.source, text_field = 'text')
print(news.corpus)


#-----------------------------------
# 3. 데이터 클랜징
#-----------------------------------
# 특수문자, 숫자, 공백 등을 제거한다.
# 텍스트를 소문자로 변환하고, 특수 문자, 숫자, 불용어를 제거한다.

news.corpus <- tokens(news.corpus, what = "word",
                      remove_numbers = TRUE,
                      remove_punct = TRUE,
                      remove_symbols = TRUE,
                      split_hyphens = TRUE,
                      remove_url = TRUE) %>%
  tokens_remove(stopwords("en")) %>%
  tokens_tolower(keep_acronyms = FALSE) %>%
  tokens_wordstem("english")
print(news.corpus)


#-----------------------------------
# 3. 특징 추출 (Feature Extraction)
#-----------------------------------
#  특징 추출에서는 TF-IDF (Term Frequency-Inverse Document Frequency) 방법을
#  활용하여 텍스트 데이터에서 주요 키워드를 식별한다.

# dfm을 계산
news.dtm <- dfm(news.corpus)

# TF-IDF 구하기

news.dtm.tfidf <- dfm_tfidf(news.dtm)


# =======================================
# 빈도 분석
# =======================================


# This section creates a graph of the 50 most frequent words in the corpus.
news.freq <- textstat_frequency(news.dtm, n = 50)
print(news.freq)

# Sort by reverse frequency order
news.freq$feature <- with(news.freq, reorder(feature, -frequency))

ggplot(news.freq, aes(x = feature, y = frequency)) +
  geom_point() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

frequency.table <- news.freq

# 워드 클라우드
textplot_wordcloud(news.dtm, max_words = 100,
                   color = "darkblue",
                   random_order = FALSE,
                   rotation = 0.25)

# 공기어 분석
news.dtm.Network <- fcm(news.dtm)
news.dtm.Network <- fcm(news.dtm, tri = FALSE) # Create Co-occurrence Network
feat <- names(topfeatures(news.dtm.Network, 50)) # Select most frequent Co-occurrence corpuses
set.seed(100)
news.dtm.Network <- fcm_select(news.dtm.Network, pattern = feat, verbose = FALSE)

# CON 그리기
textplot_network(news.dtm.Network, min_freq = 0.95,
                 edge_alpha = 0.8,
                 edge_size = 0.5)

# lda 토픽
tmod_lda <- textmodel_lda(news.dtm, k = 3)
tmod_lda_terms <- terms(tmod_lda, 5)
print(tmod_lda_terms)