//  Build the request data
let data = {
    fn: "common_fn",
    se: "lo_us",
    data: { 
        "phone": "abhishek",
        "password": "123"
    }
};

//  Convert to JSON string
let jsonStr = JSON.stringify(data);

//  URL encode
let urlEncoded = encodeURIComponent(jsonStr);

//  Base64 encode
let base64Encoded = btoa(urlEncoded);

//  Save into environment variable
pm.environment.set("payload", base64Encoded);


------------------------------------------------------


let encrypted;

try {
    // If response is JSON with "payload"
    encrypted = pm.response.json().payload;
} catch (e) {
    // Else, take raw response text
    encrypted = pm.response.text();
}

// Base64 decode
let base64Decoded = atob(encrypted);

// URL decode
let urlDecoded = decodeURIComponent(base64Decoded);

let jsonData;
try {
    jsonData = JSON.parse(urlDecoded);
} catch (e) {
    jsonData = { raw: urlDecoded };
}

// Log in console
console.log("Decoded Response:", jsonData);

// Show visualizer
pm.visualizer.set(`
<html>
<head>
  <style>
    body { font-family: Arial, sans-serif; padding: 10px; }
    pre {
      background: #f4f4f4;
      padding: 10px;
      border-radius: 8px;
      white-space: pre-wrap;
      word-break: break-word;
    }
  </style>
</head>
<body>
  <h3>Decoded API Response</h3>
  <pre>{{json}}</pre>
</body>
</html>
`, {
    json: JSON.stringify(jsonData, null, 2)
});
