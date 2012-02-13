<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>JWChat - Показать сообщение</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <script src="emoticons.js" language="JavaScript1.2"></script>
    <script src="shared.js" language="JavaScript1.2"></script>
    <script src="switchStyle.js"></script>
    <script language="JavaScript1.2">
      <!--
var messages = new Array();
var curMSG = lastMSG = 0;
		
function showMSG() {

  /* look for error message */
  if (messages[curMSG].getNode().getElementsByTagName('error').item(0)) {
		var aErr = messages[curMSG].getNode().getElementsByTagName('error').item(0);
		
		if (aErr.getAttribute('code'))
			document.getElementById('error_code').innerHTML = aErr.getAttribute('code');
		if (aErr.firstChild.nodeValue)
			document.getElementById('error_data').innerHTML = aErr.firstChild.nodeValue;
	}

  /*set subject */
  if (messages[curMSG].getSubject())
    document.getElementById('subject').innerHTML = messages[curMSG].getSubject();

  /* set date */
  var date;
	if (messages[curMSG].jwcTimestamp)
		date = messages[curMSG].jwcTimestamp;
	else
		date = new Date();

  document.getElementById('date').innerHTML = date.toLocaleString();

	/* set body */
	msgbox.document.body.innerHTML = msgFormat(messages[curMSG].getBody());

  /* set buttons */
  if (curMSG == 0)
    document.forms[0].elements["prevButton"].disabled = true;
  else 
    document.forms[0].elements["prevButton"].disabled = false;
  if (curMSG+1==lastMSG && srcW.error_messages.length == 0)
    document.forms[0].elements["nextButton"].disabled = true;
  else
    document.forms[0].elements["nextButton"].disabled = false;
}
		
function getNextMSG() { // gets message from roster
	messages[lastMSG++] = srcW.error_messages[0];
	srcW.error_messages = srcW.error_messages.slice(1,srcW.error_messages.length);
}
		
function next() {
  curMSG++;
  if (curMSG == lastMSG) {
    if (srcW.error_messages.length > 0)
      getNextMSG();
    else
      curMSG--;
  }
  
  showMSG();
  return false;
}

function prev() {
  curMSG--;
  if (curMSG < 0)
    curMSG = 0;
  showMSG();
  return false;
}
		
var srcW, user;
function init() {
  srcW = opener.top;
  if (srcW.error_messages.length > 0) {
    // show messages
    document.title = "Ошибка"; // set title
    getNextMSG();
    showMSG();
  }
}

onload = init;
      //-->
    </script>
  </head>
  <body style="margin:8px;">
    <form name="msg" style="margin:0; padding:0;">
    <table width="100%" height="100%">
        <tr><td style="color: red;"><b>Ошибка <span id="error_code"></span>:</b> <span id="error_data"></span></td></tr>
        <tr><td><hr noshade size="1"></td></tr>
        <tr><td><b>Дата:</b> <span id="date"></span></td></tr>
        <tr><td><b>Тема:</b> <span id="subject"></span></td></tr>
        <tr height="100%"><td height="100%"><iframe src="chat_iframe.html" id="msgbox" name="msgbox" scrolling="auto" style="width: 100%; height: 100%;"></iframe></td></tr>
        <tr><td><hr noshade size="1"></td></tr>
        <tr><td align="right"><button onClick="return prev();" id="prevButton">предыдущий</button>&nbsp;<button onClick="return next();" id="nextButton">следующий</button>&nbsp;<button onClick="window.close();">Закрыть</button></td></tr>
    </table>
    </form>
  </body>
</html>
