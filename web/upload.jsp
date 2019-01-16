<%@page import = "java.io.*, java.util.*, javax.servlet.*, java.sql.*" %>
<%@page import = "javax.servlet.http.*" %>
<%@page import = "org.apache.commons.fileupload.*" %>
<%@page import = "org.apache.commons.fileupload.disk.*" %>
<%@page import = "org.apache.commons.fileupload.servlet.*" %>
<%@page import = "org.apache.commons.io.output.*" %>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (Exception ex) {
        System.out.println("Could not find driver to MySQL Database!");
    }
    ServletContext context = pageContext.getServletContext();
    String filePath = context.getInitParameter("file-upload");
    String tempFilePath = context.getInitParameter("file-temp");
    String urldb = context.getInitParameter("urldb");
    String user = context.getInitParameter("user");
    String password = context.getInitParameter("password");

    if (request.getMethod().equals("POST")) {
        File file;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;

        // Verify the content type
        String contentType = request.getContentType();

        if (contentType.indexOf("multipart/form-data") >= 0) {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);

            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File(tempFilePath));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // maximum file size to be uploaded.
            upload.setSizeMax(maxFileSize);

            try {
                // Parse the request to get file items.
                List fileItems = upload.parseRequest(request);

                // Process the uploaded file items
                Iterator i = fileItems.iterator();

                while (i.hasNext()) {
                    FileItem fi = (FileItem) i.next();
                    if (!fi.isFormField()) {
                        // Get the uploaded file parameters
                        String fieldName = fi.getFieldName();
                        String fileName = fi.getName();
                        boolean isInMemory = fi.isInMemory();
                        long sizeInBytes = fi.getSize();

                        // Write the file
                        fi.write(new File(filePath + "/" + fileName));
                        out.print("<p>Uploaded Filename: " + filePath + "/" + fileName + "</p>");

                        // SAVE TO DATABASE
                        Connection conn = null;
                        try {
                            conn = DriverManager.getConnection(urldb, user, password);
                            String insertSQL = "INSERT INTO picture (pic_name, pic_file) VALUES (?,?)";
                            PreparedStatement pstmt = conn.prepareStatement(insertSQL);
                            // read the file
                            File f = new File(filePath + "/" + fileName);
                            FileInputStream input = new FileInputStream(f);

                            // set parameters
                            pstmt.setString(1, filePath + "/" + fileName);
                            pstmt.setBinaryStream(2, input);

                            // store the resume file in database
                            System.out.println("Reading file " + f.getAbsolutePath());
                            System.out.println("Store file in the database.");
                            pstmt.executeUpdate();
                            pstmt.close();
                            conn.close();
                            System.out.println("OK!");
                            out.print("<p>Database has been updated with " + filePath + "/" + fileName + "</p>");
                        } catch (SQLException ex) {
                            System.out.println("Problem with database");
                            System.out.println(ex);
                            out.print("<p>Database could not be updated with " + filePath + "/" + fileName + "</p>");
                        }

                    }
                }

            } catch (Exception ex) {
                System.out.println(ex);
                out.print("<p>Could not upload file. Check size ! </p>");
            }
        } else {
            out.print("<p>No file uploaded</p>");
        }
    } else {
        out.print("<p>Waiting for file upload</p>");
    }

    // Fetch data from pictures
    Connection conn = null;
    try {
        conn = DriverManager.getConnection(urldb, user, password);
        String selectSQL = "SELECT pic_name, pic_file FROM picture";
        PreparedStatement pstmt = conn.prepareStatement(selectSQL);
        ResultSet rs = pstmt.executeQuery();
%>
<table>
    <thead>
        <tr>
            <th>FILENAME</th><th>FILE</th>
        </tr>
    </thead>
    <tbody>
        <%
            while (rs.next()) {
                String fname = rs.getString("pic_name");
                InputStream ffile = rs.getBinaryStream("pic_file");
                out.print("<tr><td>" + fname + "</td><td><img src=\"" + ffile.readAllBytes() + "\"/></td></tr>");
            };
        %>
    </tbody>
    <tfoot>
        <tr>
            <td>...</td><td>...</td>
        </tr>
    </tfoot>
</table>
<%
        pstmt.close();
        rs.close();
        conn.close();

    } catch (SQLException ex) {
        System.out.println("Problem with database");
        System.out.println(ex);

    }
%>
