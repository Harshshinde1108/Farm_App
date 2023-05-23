<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Farm_App","root","root");
PreparedStatement ps=con.prepareStatement("select * from Customer_details where contact=?");
Cookie []cookies=request.getCookies();
String contact=cookies[0].getValue();
long mobile=Long.parseLong(contact);
PrintWriter pw=response.getWriter();
ps.setLong(1, mobile);
ResultSet rs=ps.executeQuery();
rs.next(); 
if(rs.getLong(2)==mobile)
{
%>
<div class="container" align="center">
<form action="StoreData" method="post">
        <div class="f-group">
            <label for="">Category </label>
            <select name="slct1" id="slct1" onchange="populate(this.id,'slct2')" required>
                <option value="" selected disabled>--select category--</option>
                <option value="fruits">Fruits</option>
                <option value="vagitables">Vegetables</option>
                <option value="grains">Grains</option>
                <option value="milk">Milk</option>
                <option value="eggs">Eggs</option>
            </select>
        </div>
        <div class="f-group">
            <label for="">sub category</label>
            <select name="slct2" id="slct2">--sub category--</select>
        </div>
        <script>
            function populate(s1,s2)
            {
                var s1=document.getElementById(s1);
                var s2=document.getElementById(s2);

                s2.innerHTML="";
                if(s1.value=='fruits')
                {
                    var optionArray=[
'apple|Apple',
'almond|Almond',
'apricot|Apricot',
'avocado|Avocado',
'banana|Banana',
'berry|Berry',
'black currant|Black Currant',
'blackberry|Blackberry',
'blueberry|Blueberry',
'cashew|Cashew',
'cherry|Cherry',
'coconut|Coconut',
'cucumber|Cucumber',
'custard apple|Custard Apple',
'dates|Dates',
'fig|Fig',
'gooseberry|Gooseberry',
'grapefruit|Grapefruit',
'grapes|Grapes',
'guava|Guava',
'jackfruit|Jackfruit',
'jujube|Jujube',
'kiwi|Kiwi',
'lemon|Lemon',
'lychee|Lychee',
'mango|Mango',
'mulberry|Mulberry',
'muskmelon|Muskmelon',
'naseberry|Naseberry',
'olive|Olive',
'orange|Orange',
'papaya|Papaya',
'peach|Peach',
'pear|Pear',
'persimmon|Persimmon',
'pineapple|Pineapple',
'plum|Plum',
'pomegranate|Pomegranate',
'prickly  pear|Prickly  Pear',
'quince|Quince',
'raisins|Raisins',
'raspberry|Raspberry',
'startfruit|Startfruit',
'strawberry|Strawberry',
'sugar cane|Sugar Cane',
'sweet lime|Sweet Lime',
'tamarind|Tamarind',
'walnut|Walnut',
'water chestnut|Water Chestnut',
'watermelon|Watermelon',
'wood apple|Wood Apple'
                                    ];
                }
                else if(s1.value=='vagitables')
                {
                    var optionArray=[
'bitter gourd|Bitter Gourd',
'coriander leaf|Coriander Leaf',
'cauliflower|Cauliflower',
'peas|Peas',
'apple gourd|Apple Gourd',
'beetroot|Beetroot',
'beetroot|Beetroot',
'bell pepper|Bell Pepper',
'bitter gourd|Bitter Gourd',
'blackpepper|Black Pepper',
'bottle gourd|Bottle Gourd',
'brinjal|Brinjal',
'cabbage|Cabbage',
'capsicum|Capsicum',
'carrot|Carrot',
'cauliflower|Cauliflower',
'chilli|Chilli',
'coriander|Coriander',
'cucumber|Cucumber',
'drumstick|Drumstick',
'garlic|Garlic',
'ginger|Ginger',
'green bean|Green bean',
'green onion|Green onion',
'ivy gourd|Ivy gourd',
'jackfruit|Jackfruit',
'ladys finger|Ladys finger',
'mushroom|Mushroom',
'onion|Onion',
'peas|Peas',
'potato|Potato',
'pumpkin|Pumpkin',
'raddish|Raddish',
'redchillies|Redchillies',
'ridged gourd|Ridged gourd',
'snake gourd|Snake gourd',
'spinach|Spinach',
'sweet potato|Sweet Potato',
'tomato|Tomato',
'zucchini|Zucchini'
];
                }
                else if(s1.value=='grains')
                {
                    var optionArray=[
'barley|Barley',
'barley|Barley',
'beans|Beans',
'bengal gram|Bengal Gram',
'black gram|Black gram',
'black-eyed beans/ black- eyed pea/ goat pea|Black-eyed beans/ black- eyed pea/goat pea',
'finger miller|Finger miller',
'gram /yellow gram/chickpeas|Gram /yellow gram/chickpeas',
'green gram|Green gram',
'green peas|Green peas',
'kidney beans|Kidney beans',
'lentil|Lentil',
'maize/corn|Maize/corn',
'millet|Millet',
'paddy|Paddy',
'pea|Pea',
'peanuts|Peanuts',
'pearl millet|Pearl millet',
'pigeon pea|Pigeon pea',
'ragi|Ragi',
'rice|Rice',
'sorghum / jowar/  great millet/ milo|Sorghum / jowar/  great millet/ milo',
'sorghum|Sorghum',
'soyabean|Soyabean',
'split black gram|Split black gram',
'split chickpeas |Split chickpeas ',
'split green gram|Split green gram',
'split lentil|Split lentil',
'split pigeon pea|Split pigeon pea',
'wheat|Wheat'
                    ];
                }
                else if(s1.value=='milk')
                {
                    var optionArray=[
                        'curd|Curd',
                        'milk|Milk',
                        'buttermilk|Buttermilk',
                        'ghee|Cow Ghee'
                    ];
                }
                else if(s1.value=='eggs')
                {
                    var optionArray=['chicken eggs|Chicken eggs'];
                }
                for(var option in optionArray)
                {
                    var pair=optionArray[option].split("|");
                    var newoption=document.createElement("option");
                    newoption.value=pair[0];
                    newoption.innerHTML=pair[1];
                    s2.options.add(newoption);
                }
            }
        </script>
        <div>
        	<label>Selling Quantity in KG <sup style="color: red;">*</sub></label>
        	<input type="number" name="qty" required><br>
        	<label>Price per KG<sup style="color: red;">*</sub> </label>
        	<input type="number" name="price" required>
        </div><br>
         <div>
         	<label>attach min 2 photos ***only images allowed***</label><br>
        	<sup style="color: red;">*</sup><input type="file" accept="image/*" name="img1" required><br>
        	<sup style="color: red;">*</sup><input type="file" accept="image/*" name="img2" required><br>
        	<input type="file" accept="image/*" name="img3"><br>
        	<input type="file" accept="image/*" name="img4"><br>
        	<label>Enter your Address:</label><sup style="color: red;">* </sup><input type="text" name="add" required="required">
        </div><br>
        <div>
        	<input type="checkbox" name="deliver" value="deliver">
        	<label>delivered to customer address</label><br>
        	<input type="checkbox" name="take" value="take">
        	<label>take away</label><br>
        </div>
        	<button type="submit">submit</button>
        </form>
    </div>
<%
}
%>
<%
}
catch (ClassNotFoundException e) 
{
%>
	<h2>Something went wrong please try after sometime sell class not fount</h2>
<%
}
catch(Exception e)
{
%>
	<h2>Something went wrong please try after sometime sell exception</h2>
<% 
}
%>
</body>
</html>