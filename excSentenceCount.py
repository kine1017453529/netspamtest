__author__ = 'srayana'

import nltk
import nltk.tokenize.punkt
import codecs
import re
import csv
import sys

def excSentenceCount(filename, outputFile):

    with codecs.open(filename, 'r', 'utf-8') as f:
        data1 = f.readlines()
    f.close()

    writer = csv.writer(open(outputFile, 'w',encoding='utf8',newline=''))

    for line in data1:
        count = re.split("\s+", line, 1)[0]
        if len(re.split("\s+", line, 1)) > 1:
            line = re.split("\s+", line, 1)[1]
            tokenized_sentences = nltk.sent_tokenize(line)
            countExc = 0
            countSent = 0
            for sentence in tokenized_sentences:
                countSent += 1
                if '!' in sentence:
                    countExc += 1
            if countSent > 0:
                ratioExcSent = float(countExc)/countSent
            else:
                ratioExcSent = 0.0
            writer.writerow([count, ratioExcSent])


x="Yelp_Hotel_SpEagle_content0_1V2.csv"
y="output_REStest.csv"
sys.stdout.write(str(excSentenceCount(x,y)))