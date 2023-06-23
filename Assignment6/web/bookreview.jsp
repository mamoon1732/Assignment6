<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   try {
        //create connection to database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/highrepublic", "root", "admin");
        
        Statement stmt = con.createStatement();
        
        ArrayList <String> stories = new ArrayList<>();
        
        ResultSet rs = stmt.executeQuery("SELECT BookName FROM books");
        
        while (rs.next())
        {
            stories.add(rs.getString("BookName"));
        }
        
        rs = stmt.executeQuery("SELECT * FROM Books");
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
        <h1 class="test">High Republic Book Reviews!</h1>
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
        <h1>Submit a Review</h1>
        <form method="post">
            <label>Enter Your Name</label>
            <input type="textbox" name="name" ><br>
            
            <label>Select a Story</label>
            <select name="story">
                <%
                while (rs.next()){  
                %>
                    <option value="<%out.print(rs.getString("BookName"));%>"><%out.print(rs.getString("BookName"));%></option>
                <%
                }
                %>
            </select>
            <br>
            
            <label>Enter Score</label>
            <input type="textbox" name="score"><br>
            
            <input type="submit" value="Submit">
            
            <%
            String name = "";
            String story = "";
            int score = 0;

            if (request.getMethod().equalsIgnoreCase("post"))
            {
                name  = request.getParameter("name");
                story = request.getParameter("story");
                score = Integer.parseInt(request.getParameter("score"));
            %>
            
            <p>
                <%
                
                    out.println("Thank You " + name);
                %>
            </p>
            
            <p>
                <%
                    out.println("The story that you reviewed (" + story + ") shalled be added to our review records!");
                %>
            </p>
            
            <p>
                <%
                    out.println("You gave it a score of " + score);
            }
                %>
            </p>
            
        </form>
        
        <h1>List of Reviews</h1>
        <%

        rs = stmt.executeQuery("SELECT * FROM BookReviews");    
            
        ArrayList <String> reviewName = new ArrayList<>();
        ArrayList <String> bookName = new ArrayList<>();
        ArrayList <Integer> bookScore = new ArrayList<>();
        
        while (rs.next()){
            reviewName.add(rs.getString("ReviewName"));
            bookName.add(rs.getString("BookName"));
            bookScore.add(rs.getInt("BookScore"));
        }
        
        if (!name.isEmpty() && !story.isEmpty())
        {
            stmt.executeUpdate("INSERT INTO BookReviews (BookReviewID, ReviewName, BookName, BookScore) VALUES (" + (reviewName.size() + 1) + ", '" + name + "', '" + story + "', " + score + ")");
        }
        
        for (int x = 0; x < reviewName.size(); x++)
            {   
            %>
            <div class="reviewContainer">
                <p>Reviewer Name:
                <%
                out.println(reviewName.get(x));
                %>
                </p>
                <p>Book Reviewed:
                <% 
                out.println(bookName.get(x));
                
                    if (bookName.get(x).equalsIgnoreCase(stories.get(0)))
                    {
                        %>
                        <img src="light.jpg" alt="Image of Light of the Jedi" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(1)))
                    {
                        %>
                        <img src="storm.jpg" alt="Image of The Rising Storm" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(2)))
                    {
                        %>
                        <img src="star.jpg" alt="Image of The Fallen Star" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(3)))
                    {
                        %>
                        <img src="dark.jpg" alt="Image of Into the Dark" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(4)))
                    {
                        %>
                        <img src="shadows.jpg" alt="Image of Out of the Shadows" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(5)))
                    {
                        %>
                        <img src="horizon.jpg" alt="Image of Midnight Horizon" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(6)))
                    {
                        %>
                        <img src="courage.jpg" alt="Image of Test of Courage" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(7)))
                    {
                        %>
                        <img src="crashpoint.jpg" alt="Image of Race to Crashpoint Tower" class="reviewPic">
                        <%
                    }

                    else if (bookName.get(x).equalsIgnoreCase(stories.get(8)))
                    {
                        %>
                        <img src="disaster.jpg" alt="Image of Mission to Disaster" class="reviewPic">
                        <%
                    }
                %>
                </p>
                <p>Reviewer's Score:
                <% 
                out.println(bookScore.get(x));
                %>
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
