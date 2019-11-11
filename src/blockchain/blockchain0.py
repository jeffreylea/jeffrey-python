#!/usr/bin python
# -*- coding:utf-8 -*-
import hashlib as hasher
import json
from difflib import _test
from _dummy_thread import _main
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
def hash(data,previous_hash):
    sha = hasher.sha256()
    sha.update("{0}{1}".format(data, previous_hash))
    return sha.hexdigest()
def make_a_block(data,previous_hash):
    block = {}
    block["data"] = data
    block["previous_hash"]=previous_hash
    block["hash"]=hash(data, previous_hash)
    return block
def make_a_genesis_block():
     data = "0"
     previous_hash="0"
     blockchain.append(make_a_block(data, previous_hash))

if  _name_==_main_
print(json.dumps(blockchain))
    
