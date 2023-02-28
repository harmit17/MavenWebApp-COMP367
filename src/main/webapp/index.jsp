<html>
<body>
<%
  int hour = java.util.Calendar.getInstance().get(java.util.Calendar.HOUR_OF_DAY);
  String greeting;
  if (hour >= 0 && hour < 12) {
    greeting = "Good morning";
  } else if (hour >= 12 && hour < 18) {
    greeting = "Good afternoon";
  } else {
    greeting = "Good evening";
  }
  String name = "Harmit"; // Replace with the student's name
%>
<h1><%= greeting %>, <%= name %>, Welcome to COMP367!</h1>

</body>
</html>
