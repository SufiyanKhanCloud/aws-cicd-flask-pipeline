import os
import socket
from datetime import datetime, timezone

from flask import Flask, jsonify

app = Flask(__name__)

APP_VERSION = os.getenv("APP_VERSION", "1.0.0")


@app.route("/")
def index():
    return jsonify(
        message="Shipped via CodePipeline -> CodeBuild -> CodeDeploy",
        version=APP_VERSION,
        served_by=socket.gethostname(),
        time_utc=datetime.now(timezone.utc).isoformat(timespec="seconds"),
    )


@app.route("/health")
def health():
    return jsonify(status="ok"), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=os.getenv("FLASK_DEBUG") == "1")
