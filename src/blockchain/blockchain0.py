#!/usr/bin python
# -*- coding:utf-8 -*-
import hashlib as hasher
import json
from time import time
from builtins import round
from flask import Flask, jsonify,render_template
from argparse import ArgumentParser
from _operator import index
from jinja2 import nodes
import requests
blockchain = []
nodes=[]
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
print(__name__.capitalize())
app=Flask(__name__)

def get_blockchain():
    return jsonify(blockchain)
def add_node(node):
    nodes.append(node)
@app.route("/say/<string:data>",methods=['GET'])
def add_blockchain(data):
    add_a_block(data)
    return jsonify(blockchain)
@app.route("/")
def home():
    return render_template("index.html")
@app.route("/blocks/last")
def get_last_block():
    last_block=blockchain[len(blockchain)-1]
    return jsonify(last_block)
@app.route("/blocks/<int:index>")
def get_block(index):
    if(len(blockchain)>=index):
        block=blockchain[index]
        return jsonify(block)
    else:
        return jsonify({"":""})
@app.route("/blocks/<int:from_index>/<int:to_index>")
def get_blocks_from_to(from_index,to_index):
    blocks=blockchain[from_index:to_index]
    return jsonify(blocks)
@app.route("/blocks/all")
def get_all_block():
    return jsonify(blockchain)
#查看区块链高度
@app.route("/blocks/height")
def get_blocks_height():
    last_block=blockchain[len(blockchain)-1]
    return jsonify(last_block["index"])
def get_height():
    last_block=blockchain[len(blockchain)-1]
    return last_block["index"]
#添加node节点
@app.route("/nodes/add/<string:ip>/<string:port>",methods=['GET'])
def add_nodes(ip,port):
    node={"ip":ip,"port":port}
    if node not in nodes:
        nodes.append(node)
    return jsonify(nodes)
#查看所有节点
@app.route("/nodes/all",methods=['GET'])
def get_nodes():
    return jsonify(nodes)
@app.route("/blocks/sync")
def blocks_sync():
    for node in nodes:
        ip = node["ip"]
        port = node["port"]
        url_height="http://{0}:{1}/blocks/height".format(ip, port)
        url_blocks="http://{0}:{1}/blocks/all".format(ip, port)
        try:
            r_height=requests.get(url_height)
            height=int(r_height.json())
            self_height=get_height()
            if self_height<height:
                r_blocks_all=requests.get(url_blocks)
                blockchain.clear()
                blockchain=r_blocks_all
                return jsonify("synced")
            else:
                return jsonify("no synced")
        except:
           return jsonify("error") 
    return jsonify("no nodes")
if __name__ == '__main__':
    make_a_genesis_block()
    add_a_block("this block 1")
    add_a_block("this block 2")
    add_a_block("this block 3")
    print(json.dumps(blockchain))
    parser=ArgumentParser()
    parser.add_argument("-p","--port",default=8080,type=int,help="port is using")
    args=parser.parse_args()
    port = args.port
    app.run(host='0.0.0.0', port=port, debug=True)

    
