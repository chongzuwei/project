<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Created</title>
    <style>
        /* Styling to match the provided image */
        body {
            font-family: Arial, sans-serif;
            background-color: #eaf8ff; /* Light blue background */
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 0;
            padding: 50px 20px;
            color: #333;
        }
        h1 {
            font-size: 2em;
            margin-bottom: 40px;
            text-align: center;
        }
        .post-grid {
            width: 100%;
            max-width: 900px;
            display: grid;
            /* Layout cards in 2 columns for wider screens, 1 for mobile */
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            justify-content: center;
        }
        .card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card h2 {
            font-size: 1.1em;
            font-weight: bold;
            color: #1a75ff;
            margin-top: 0;
            margin-bottom: 10px;
            line-height: 1.4;
        }
        .card p {
            font-size: 0.9em;
            line-height: 1.5;
            color: #555;
            margin-bottom: 20px;
            text-align: left;
            flex-grow: 1; /* Allows text content to push delete button down */
        }
        .delete-btn, .back-btn {
            padding: 12px 20px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1em;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.2s;
        }
        .delete-btn:hover, .back-btn:hover {
            background-color: #333;
        }
        .back-btn-container {
            margin-top: 50px;
            width: 100%;
            max-width: 400px;
        }
    </style>
</head>
<body>

    <h1>Post Created:</h1>

    <%! 
        // JSP Declaration: Define a simple inner class to hold resource data
        public class Resource {
            public String title;
            public String description;
            public Resource(String title, String description) {
                this.title = title;
                this.description = description;
            }
        }
    %>

    <div class="post-grid">
        
        <%
            // JSP Scriptlet: Simulate getting data from a server-side source
            List<Resource> resources = new ArrayList<>();
            resources.add(new Resource("Mental Health At Work", "Adults and youths working on private works are not talked about too much but are also something to minimize tension and anxieties up to work and improve that related to work performance and productivity."));
            resources.add(new Resource("Mental Health Resources For Children and Young People", "We have a range of information, advice as well as resources including things like wellbeing activities, toolkits and webinars to help you support the young."));
            resources.add(new Resource("The National Strategic Plan For Mental Health 2020-2025", "Mental health has always been defined by one of the representative dimensions of health from the inception of the World Health Organization (WHO) until..."));
            resources.add(new Resource("The National Strategic Plan For Mental Health 2020-2025", "Mental health has always been defined by one of the representative dimensions of health from the inception of the World Health Organization (WHO) until..."));
            
            // JSP Scriptlet: Loop through the resources list
            for (Resource resource : resources) {
        %>
            
            <!-- HTML structure for a single card, generated dynamically -->
            <div class="card">
                <div class="content">
                    <h2><%= resource.title %></h2>
                    <p><%= resource.description %></p>
                </div>
                <button class="delete-btn">Delete</button>
            </div>
            
        <%
            } // End of the for loop
        %>
        
    </div>
    
    <div class="back-btn-container">
        <button class="back-btn">Back</button>
    </div>

</body>
</html>