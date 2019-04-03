<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.io.output.DeferredFileOutputStream"%>
<%@page import="com.bid.bean.Product,com.bid.dao.ProductDao,java.util.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <jsp:useBean id="info" class="com.bid.bean.Product"></jsp:useBean>
        <jsp:setProperty property="*" name="info"></jsp:setProperty>
        
<%

   ProductDao oService = new ProductDao();

    //process only if its multipart content
    if (ServletFileUpload.isMultipartContent(request)) {
        try {
            List<FileItem> multiparts = new ServletFileUpload(
                    new DiskFileItemFactory()).parseRequest(request);

            for (FileItem item : multiparts) {
                if (!item.isFormField()) {

                    String name = new File(item.getName()).getName();

                    String type = item.getContentType();

                    if (!name.equalsIgnoreCase("")) {
                        if (type.equalsIgnoreCase("image/jpeg")
                                || type.equalsIgnoreCase("image/jpg")
                                || type.equalsIgnoreCase("image/png")) {
                            /* Get the size of the uploaded file in bytes. G:\PROJECT\bid\build\web\image\product*/
                            long fileSize = item.getSize();
                            if (fileSize <= 9000000) {
                                type = "." + type.substring(type.lastIndexOf("/") + 1);
                                name = name + type;
                                String path = getServletContext().getRealPath("/");
                                item.write(new File(path + "image/product" + File.separator + name));

                              //  info.setItImage(nsame);
                              info.setFilename(name);
                            } else {
                                session.setAttribute("error_code", "404");
                                session.setAttribute("msg", "File size should be less than 1 MB.");
                                response.sendRedirect("home.jsp");
                                return;
                            }
                        } else {
                            session.setAttribute("error_code", "404");
                            session.setAttribute("msg", "File type is incorrect. Please upload jpeg or jpg or png file only.");
                            response.sendRedirect("home.jsp");
                            return;
                        }

                        
                    }
                    
                    oService = new ProductDao();
                        if (info.getPid() != 0) {
                           // oService.updateFileName(info);
//                           oService.insert(info);
                        } else {
                            oService.addProduct(info);
                        }
                } else if (item.getFieldName().equalsIgnoreCase("pname")) {
                    info.setPname(item.getString());
                } else if (item.getFieldName().equalsIgnoreCase("category")) {
                    info.setCategory(item.getString());
                }else if (item.getFieldName().equalsIgnoreCase("description")) {
                    info.setDescription(item.getString());
                } else if (item.getFieldName().equalsIgnoreCase("initialprice")) {
                    info.setInitialprice(item.getString());
                } else if (item.getFieldName().equalsIgnoreCase("date")) {
                    info.setDate(item.getString());
                }
            }

            //File uploaded successfully
            session.setAttribute("msg", "File Uploaded Successfully");
        } catch (Exception ex) {
            session.setAttribute("error_code", "404");
            session.setAttribute("msg", "File Upload Failed due to " + ex);
        }

    } else {
        session.setAttribute("error_code", "404");
        session.setAttribute("msg", "Sorry this Servlet only handles file upload request");
    }

    response.sendRedirect("home.jsp");
%>

    </body>
</html>
