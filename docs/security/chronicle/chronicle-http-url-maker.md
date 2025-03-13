---
title: Chronicle HTTP Url maker
---



<style>
  textarea, input[type="text"] {
    width: 90%;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    font-size: 16px;
  }
</style>

<body>

<label for="url">URL:</label><br>
<input type="text" id="url" name="url" oninput="generateUrl()"><br><br>

<label for="chronicleKey">Key from Chronicle UI:</label><br>
<input type="text" id="chronicleKey" name="chronicleKey" oninput="generateUrl()"><br><br>

<label for="gcpKey">Key from GCP:</label><br>
<input type="text" id="gcpKey" name="gcpKey" oninput="generateUrl()"><br><br>

<label for="result">Generated URL:</label><br>
<textarea id="result" name="result" rows="4" cols="50"></textarea>

<script>
function generateUrl() {
  var url = document.getElementById("url").value;
  var chronicleKey = document.getElementById("chronicleKey").value;
  var gcpKey = document.getElementById("gcpKey").value;

  var generatedUrl = url;

  if (gcpKey || chronicleKey) {
      generatedUrl += "?";
      if(gcpKey){
          generatedUrl += "key=" + gcpKey;
          if(chronicleKey){
              generatedUrl += "&";
          }
      }
      if(chronicleKey){
          generatedUrl += "secret=" + chronicleKey;
      }

  }

  document.getElementById("result").value = generatedUrl;
}
</script>

</body>
