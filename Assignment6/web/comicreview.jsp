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
        
        ResultSet rs = stmt.executeQuery("SELECT ComicName FROM comics");
        
        while (rs.next())
        {
            stories.add(rs.getString("ComicName"));
        }
        
        rs = stmt.executeQuery("SELECT * FROM Comics");
        
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
        <h1 class="test">High Republic Comic Reviews!</h1>
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
                    <option value="<%out.print(rs.getString("ComicName"));%>"><%out.print(rs.getString("ComicName"));%></option>
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
            
        rs = stmt.executeQuery("SELECT * FROM ComicReviews");

        ArrayList <String> reviewName = new ArrayList<>();
        ArrayList <String> comicName = new ArrayList<>();
        ArrayList <Integer> comicScore = new ArrayList<>();
        
        while (rs.next()){
            reviewName.add(rs.getString("ReviewName"));
            comicName.add(rs.getString("ComicName"));
            comicScore.add(rs.getInt("ComicScore"));
        }
        
        if (!name.isEmpty() && !story.isEmpty())
        {
            stmt.executeUpdate("INSERT INTO ComicReviews (ComicReviewID, ReviewName, ComicName, ComicScore) VALUES (" + (reviewName.size() + 1) + ", '" + name + "', '" + story + "', " + score + ")");
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
                <p>Comic Reviewed:
                <% 
                out.println(comicName.get(x));
                
                    if (comicName.get(x).equalsIgnoreCase(stories.get(0)))
                    {
                        %>
                        <img src="highmarvel.jpg" alt="Image of The High Republic" class="reviewPic">
                        <%
                    }

                    else if (comicName.get(x).equalsIgnoreCase(stories.get(1)))
                    {
                        %>
                        <img src="adventure.jpg" alt="Image of The High Republic Adventures" class="reviewPic">
                        <%
                    }

                    else if (comicName.get(x).equalsIgnoreCase(stories.get(2)))
                    {
                        %>
                        <img src="peak.jpg" alt="Image of The Monster of Temple Peak" class="reviewPic">
                        <%
                    }

                    else if (comicName.get(x).equalsIgnoreCase(stories.get(3)))
                    {
                        %>
                        <img src="edge.jpg" alt="Image of The Edge of Balance" class="reviewPic">
                        <%
                    }

                    else if (comicName.get(x).equalsIgnoreCase(stories.get(4)))
                    {
                        %>
                        <img src="trail.jpg" alt="Image of Trail of Shadows" class="reviewPic">
                        <%
                    }

                    else if (comicName.get(x).equalsIgnoreCase(stories.get(5)))
                    {
                        %>
                        <img src="eye.jpg" alt="Image of Eye of the Storm" class="reviewPic">
                        <%
                    }
                %>
                </p>
                <p>Reviewer's Score:
                <% 
                out.println(comicScore.get(x));
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