__author__ = 'srayana'

import nltk
import nltk.tokenize.punkt
import codecs
import re
import sys
import string

def biGram(filename, outputFile):
    # print('Shingling: ')
    #
    # file = 'emoticons.txt'
    # emoticons = list()
    #
    # with open(file, 'r') as f:
    #     data = f.readlines()
    # f.close()

    # for d in data:
    #     emo = d.rstrip('\n')
    #     emoticons.append(emo)

    with codecs.open(filename, 'r', 'utf-8') as f:
        data1 = f.readlines()
    f.close()

    output = codecs.open(outputFile, 'a', 'utf-8')
    regex = re.compile('[%s]' % re.escape(string.punctuation))

    for line in data1:
        #print line
        count = re.split("\s+",line, 1)[0]
        #print count
        if len(re.split("\s+",line, 1)) > 1:
            line = re.split("\s+",line, 1)[1]
            tokenized_sentences = nltk.sent_tokenize(line)

            for sent in tokenized_sentences:
                words = nltk.word_tokenize(sent)
                #print words
                #words = sent.split()
                word = []
                temp = ""
                c = 0
                for w in words:
                    c = c + 1
                    if w in string.punctuation:
                        temp = temp+w
                        if c < len(words):
                            continue
                    if len(temp) > 1:
                        word.append(temp)
                    temp = ""
                    new_token = regex.sub(u'', w)
                    if not new_token == u'':
                        word.append(new_token)
                #print word
                myNgrams = nltk.bigrams(word)
                for bg in myNgrams:
                    s0=count
                    s0=s0+' '
                    s0=str(s0)
                    s1=bg[0].encode('ascii', 'ignore')
                    s1=str(s1)
                    s2=bg[1].encode('ascii', 'ignore')
                    s3=s0+s1
                    
                    s4=s3+'_'
                    s4=s4+s2.decode()
                    s=s4+'\n'
                    #s=count+' '+bg[0].encode('utf-8', 'ignore')+'_'+bg[1].encode('utf-8', 'ignore')+'\n'
                    #print(count+' '+bg[0].encode('ascii', 'ignore')+'_'+bg[1].encode('ascii', 'ignore')+'\n')
                    #print (s)
                    output.write(s)
    output.close()


x="Yelp_Hotel_SpEagle_content0_1V2.csv"
y="output_biGram.txt"
sys.stdout.write(str(biGram(x,y)))


