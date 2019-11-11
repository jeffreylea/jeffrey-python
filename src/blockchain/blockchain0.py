#!/usr/bin python
# -*- coding:utf-8 -*-
import hashlib as hasher
import json
from time import time
from builtins import round
from flask import Flask, jsonify
blockchain = []
'''
#散列函数用法
h=hasher.sha256("你好".encode("utf-8"))
print(h.hexdigest())

ha= hasher.sha256()
ha.update("你好".encode("utf-8"))
print(ha.hexdigest())
print("{0}{1}".format("q", "s"))
'''
def hash(index,timestamp,data,previous_hash):
    sha = hasher.sha256()
    sha.update("{0}{1}{2}{3}".format(index,timestamp,data, previous_hash).encode("utf-8"))
    return sha.hexdigest()
def make_a_block(index,timestamp,data,previous_hash):
    block = {}
    block["index"]=index
    block["timestamp"]=timestamp
    block["data"] = data
    block["previous_hash"]=previous_hash
    block["hash"]=hash(index,timestamp,data, previous_hash)
    return block
def add_a_block(data):
    last_block=blockchain[len(blockchain)-1]
    index = last_block["index"]+1
    timestamp = int(round(time()*1000))
    previous_hash= last_block["hash"]
    blockchain.append(make_a_block(index,timestamp,data, previous_hash))
def make_a_genesis_block():
    index =0
    timestamp=int(round(time()*1000))
    data = "0"
    previous_hash="0"
    blockchain.append(make_a_block(index,timestamp,data, previous_hash))
app=Flask(__name__)
@app.route("/",methods=['GET'])
def get_blockchain():
    return jsonify(blockchain)
if __name__ == '__main__':
    make_a_genesis_block()
    add_a_block("this block 1")
    add_a_block("this block 2")
    add_a_block("this block 3")
    print(json.dumps(blockchain))
    print(time())
    app.run(host='0.0.0.0', port=8080, debug=True)

    
