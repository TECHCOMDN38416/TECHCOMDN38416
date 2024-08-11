from flask import Flask, render_template, jsonify
import geocoder

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/location')
def location():
    # Get the current location (this is a placeholder; for real GPS, you'd need a different approach)
    g = geocoder.ip('me')  # This gets the location based on the IP address
    return jsonify({'latitude': g.latlng[0], 'longitude': g.latlng[1]})

if __name__ == '__main__':
    app.run(debug=True)
