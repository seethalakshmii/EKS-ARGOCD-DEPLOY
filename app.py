from flask import Flask
from prometheus_client import Counter, generate_latest

app = Flask(__name__)

request_counter = Counter(
    "flask_requests_total",
    "Total Flask Requests"
)

@app.route("/")
def home():
    request_counter.inc()
    return "Hello from Flask"

@app.route("/metrics")
def metrics():
    return generate_latest()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)