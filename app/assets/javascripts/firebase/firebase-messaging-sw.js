importScripts('https://www.gstatic.com/firebasejs/3.9.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/3.9.0/firebase-messaging.js');

var config = {
  apiKey: "AIzaSyCT0dOXVpkbIVGan2pL9gjvFUWZkOxGVow",
  authDomain: "intraner-c9984.firebaseapp.com",
  databaseURL: "https://intraner-c9984.firebaseio.com",
  projectId: "intraner-c9984",
  storageBucket: "intraner-c9984.appspot.com",
  messagingSenderId: "677643899905"
};
firebase.initializeApp(config);

const messaging =firebase.messaging();
