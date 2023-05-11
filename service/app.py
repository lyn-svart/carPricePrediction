import pickle
import numpy as np
from flask import Flask, abort, jsonify, request

model = pickle.load(open('../ml/model.pkl', 'rb'))
scaler = pickle.load(open('../ml/scaler.pkl', 'rb'))



app = Flask(__name__)
tasks = []

predCar = []
if __name__ == "__main__":
    app.debug = True
    app.run()
    
@app.route('/preds', methods=['GET'])
def get_all_pred():
    print(predCar)
    return jsonify({'pred': predCar})
@app.route('/pred', methods=['GET'])
def get_pred():
    
    return jsonify({'pred': predCar[-1]['price']})

@app.route('/pred', methods=['POST'])
def create_pred():
    prediction = scaler.transform([[int(request.json['brand']),int(request.json['model']),int(request.json['mileage']),int(request.json['transmission']),int(request.json['fuelType']),float(request.json['mpg']),float(request.json['engineSize'])]])


    
    priceArray = np.exp(model.predict(prediction))
    price = priceArray[0]
    
    pred = {'brand': request.json['brand'],'model': request.json['model'],'mileage': request.json['mileage'],'transmission': request.json['transmission'],'fuelType': request.json['fuelType'],'mpg': request.json['mpg'],'engineSize': request.json['engineSize'],'price' : price}
    
    predCar.append(pred)
    return jsonify({'pred': pred}), 201
@app.route('/tasks', methods=['POST'])
def create_task():
    task = {'title': request.json['title']}
    tasks.append(task)
    return jsonify({'task': task}), 201

@app.route('/tasks', methods=['GET'])
def get_tasks():
    return jsonify({'tasks': tasks})




