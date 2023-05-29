import nltk
import time


def get_sentences():
    with open("data/processed/sentence.txt", "r") as f:
        return f.read().splitlines()


def run(start_time, sentences):
    for idx, sentence in enumerate(sentences):
        grammar = nltk.data.load("config/grammar.cfg")
        parser = nltk.ChartParser(grammar, trace=2)
        tokens = nltk.tokenize.word_tokenize(sentence)
        print(tokens)

        trees = parser.parse(tokens)

        out = open(f"data/output/sent{idx + 1}_LeeHak.txt", "w")

        for tree in trees:
            tree.pretty_print()
            tree.draw()
            out.write(str(tree) + "\n\n")
        out.close()


if __name__ == '__main__':
    run(time.time_ns(), ['The company is looking for competent employees.'])
