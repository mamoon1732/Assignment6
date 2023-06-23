<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String authorName = request.getParameter("authorName");
    //use try/catch to catch database exceptions
    
    String authors[] = {"Cavan Scott", "Charles Soule", "Claudia Gray", "Justina Ireland", "Daniel Jose Older"};
    
    try {
        //create connection to database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/highrepublic", "root", "admin");
        
        Statement stmt = con.createStatement();
        
        ResultSet rs = stmt.executeQuery("SELECT * FROM Books WHERE AuthorName = '" + authorName + "'");
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>High Republic</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h1 class="test">High Republic Authors!</h1>
        <div class="tester">
            <nav class="navbar navbar-expand-sm">
                <div class="myNavBar">
                    <!-- links -->
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html"><i class="bi-house-fill"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="comicreview.jsp"><i class="bi-people-fill"></i>Leave a Comic Review!</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="bookreview.jsp"><i class="bi-people-fill"></i>Leave a Book Review!</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <h2>List of Books written by <%
            for (int x = 0; x < authors.length; x++)
            {
                if (authorName.equalsIgnoreCase(authors[x]))
                {
                    out.print(authors[x]);
                }
            }
            %>
            </h2>
        <%
            ArrayList <String> books = new ArrayList<>();
            ArrayList <String> genre = new ArrayList<>();
            ArrayList <String> bookDate = new ArrayList<>();
            //prints out the smallest orderNumber
            while (rs.next()){
                books.add(rs.getString("BookName"));
                genre.add(rs.getString("Genre"));
                bookDate.add(rs.getString("DatePublished"));
            }
            
            for (int x = 0; x < books.size(); x++)
            {
                %>
                <div class="tester">
                    <div class="data">
                    <strong class="myOwn">
                    <%
                        out.println("Book Name: " + books.get(x));
                        %>
                    </strong>
                        <br>
                        <% 

                        out.println("Genre: " + genre.get(x));
                        %>
                        <br>
                        <% 

                        out.println("Date Published: " + bookDate.get(x));
                        %>
                        <br>
                        <%
                    %>
                    </div>
                </div>
                <%
            }

            if (authorName.equalsIgnoreCase(authors[0]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="storm.jpg" alt="image of The Rising Storm" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[1]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="light.jpg" alt="image of Light of the Jedi" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[2]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="dark.jpg" alt="image of Into the Dark" class="bookPic">
                    </div>
                    <div class="bookContainer">    
                        <img src="star.jpg" alt="image of Light of the Jedi" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[3])) 
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="shadows.jpg" alt="image of Out of the Shadows" class="bookPic">
                    </div>
                    <div class="bookContainer">    
                        <img src="courage.jpg" alt="image of Test of Courage" class="bookPic">
                    </div>
                    <div class="bookContainer">    
                        <img src="disaster.jpg" alt="image of Mission to Disaster" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[4]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="horizon.jpg" alt="image of Midnight Horizon" class="bookPic">
                    </div>
                    <div class="bookContainer">    
                        <img src="crashpoint.jpg" alt="image of Race to Crashpoint Tower" class="bookPic">
                    </div>
                </div>
                <% 
            }

        %>
        <h2>List of Comics written by <%
            for (int x = 0; x < authors.length; x++)
            {
                if (authorName.equalsIgnoreCase(authors[x]))
                {
                    out.print(authors[x]);
                }
            }
            %>
        </h2>
        <% 

        rs = stmt.executeQuery("SELECT * FROM Comics WHERE AuthorName = '" + authorName + "'");

            ArrayList <String> comics = new ArrayList<>();
            ArrayList <String> publisher = new ArrayList<>();
            ArrayList <String> comicDate = new ArrayList<>();
            //prints out the smallest orderNumber
            while (rs.next()){
                comics.add(rs.getString("ComicName"));
                publisher.add(rs.getString("Publisher"));
                comicDate.add(rs.getString("DatePublished"));
            }
            
            for (int x = 0; x < comics.size(); x++)
            {   
                %>
                <div class="tester">
                    <div class="data">
                    <strong class="myOwn">
                    <%
                        out.println("Comic Name: " + comics.get(x));
                        %>
                        </strong>
                        <br>
                        <% 

                        out.println("Publisher: " + publisher.get(x));
                        %>
                        <br>
                        <% 

                        out.println("Date Published: " + comicDate.get(x));
                        %>
                        <br>
                        <%
                    %>
                    </div>
                </div>
                <%
            }

            if (authorName.equalsIgnoreCase(authors[0]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="highmarvel.jpg" alt="image of The High Republic" class="bookPic">
                    </div>
                    <div class="bookContainer">
                        <img src="peak.jpg" alt="image of The Monster of Temple Peak" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[1]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="eye.jpg" alt="image of Eye of the Storm" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[2]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <p>No comics yet!</p>
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[3])) 
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="edge.jpg" alt="image of Edge of Balance" class="bookPic">
                    </div>
                </div>
                <% 
            }

            else if (authorName.equalsIgnoreCase(authors[4]))
            {
                %>
                <div class="tester">
                    <div class="bookContainer">    
                        <img src="adventure.jpg" alt="image of High Republic Adventures" class="bookPic">
                    </div>
                    <div class="bookContainer">    
                        <img src="trail.jpg" alt="image of Trail of Shadows" class="bookPic">
                    </div>
                </div>
                <% 
            }
            
            //close connection
            con.close();

            }catch (Exception e){
                out.println(e);
            }//end catch
        %>
    </body>
</html>
