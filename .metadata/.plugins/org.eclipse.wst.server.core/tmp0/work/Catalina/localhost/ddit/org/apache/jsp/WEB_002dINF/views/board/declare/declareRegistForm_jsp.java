/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.57
 * Generated at: 2020-11-30 20:46:46 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.board.declare;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class declareRegistForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/views/board/declare/attach_js.jsp", Long.valueOf(1606565341757L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<div class=\"content-body\">\r\n");
      out.write("\r\n");
      out.write("\t<!-- Page Headings Start -->\r\n");
      out.write("\t<div class=\"row justify-content-between align-items-center mb-10\">\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- Page Heading Start -->\r\n");
      out.write("\t\t<div class=\"col-12 col-lg-auto mb-20\">\r\n");
      out.write("\t\t\t<div class=\"page-heading\">\r\n");
      out.write("\t\t\t\t<h3 class=\"title\" style=\"text-align: left;\">학습자료실</h3>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- Page Heading End -->\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- button -->\r\n");
      out.write("\t\t<div style=\"position: absolute; top: 25px; right: 62px;\">\r\n");
      out.write("\t\t\t<button class=\"button button-success\" id=\"registBtn\">\r\n");
      out.write("\t\t\t\t<span>등록</span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<button class=\"button button-danger\" id=\"cancelBtn\">\r\n");
      out.write("\t\t\t\t<span>취소</span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- Page Headings End -->\r\n");
      out.write("\r\n");
      out.write("\t<form role=\"form\" method=\"post\" action=\"regist.do\" name=\"registForm\"\r\n");
      out.write("\t\tenctype=\"multipart/form-data\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"post_writer\"\tvalue=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${loginUser.member_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" /> \r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"board_no\" value=\"BOARD006\" />\r\n");
      out.write("\t\t\t<div class=\"col-lg-1 mb-20\"\r\n");
      out.write("\t\t\t\tstyle=\"width: 100%; text-align: center; margin-left: 10px; margin-top: 12px; margin-right: -5px;\">\r\n");
      out.write("\t\t\t\t<h5>제목</h5>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-lg-10.5 mb-20\"\r\n");
      out.write("\t\t\t\tstyle=\"width: 86.5%; margin-left: 5px;\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"post_title\" id=\"post_title\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- summernote -->\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-12 mb-30\">\r\n");
      out.write("\t\t\t\t<div class=\"box\">\r\n");
      out.write("\t\t\t\t\t<div class=\"box-head\">\r\n");
      out.write("\t\t\t\t\t\t<h3 class=\"title\">내용</h3>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"box-body\">\r\n");
      out.write("\t\t\t\t\t\t<textarea id=\"post_content\" name=\"post_content\" class=\"summernote\" maxlength=\"10\"></textarea>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"fileInput\">\r\n");
      out.write("\t\t\t\t<button type=\"button\"\r\n");
      out.write("\t\t\t\t\tclass=\"button button-round button-primary\"\r\n");
      out.write("\t\t\t\t\tid=\"addFileBtn\">\r\n");
      out.write("\t\t\t\t\t<i class=\"zmdi zmdi-attachment-alt\"></i> 파일첨부\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t<div class=\"inputRow\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</form>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("\t$('#registBtn').on('click', function(e) {\r\n");
      out.write("\t\tvar form = document.registForm;\r\n");
      out.write("\t\t//alert($('#post_title').val().length);\r\n");
      out.write("\t\tif (form.post_title.value == \"\") {\r\n");
      out.write("\t\t\talert(\"제목은 필수적으로 입력되어야 합니다.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif ($('#post_title').val().length > 50) {\r\n");
      out.write("\t\t\talert(\"입력가능한 최대 바이트를 초과하였습니다.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif ($('#post_title').val().length > 100) {\r\n");
      out.write("\t\t\talert(\"제목 최대 입력 크기를 초과하였습니다.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tif ($('#post_content').val().length > 1000000) {\r\n");
      out.write("\t\t\talert(\"내용 최대 입력 크기를 초과하였습니다.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar files = $('input[name=\"uploadFile\"]');\r\n");
      out.write("\t \tfor(var file of files){\r\n");
      out.write("\t \t\tif(file.value==\"\"){\r\n");
      out.write("\t\t\t\talert(\"파일을 선택하세요.\");\r\n");
      out.write("\t\t\t\tfile.focus();\r\n");
      out.write("\t\t\t\tfile.click();\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t \t\t}\r\n");
      out.write("\t \t}\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tform.submit();\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t$('#cancelBtn').on('click', function(e) {\r\n");
      out.write("\t\thistory.go(-1);\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("$('div #addFileBtn').on('click',function(event){\r\n");
      out.write("\t\r\n");
      out.write("\t//alert(\"클릭\")\r\n");
      out.write("\t\r\n");
      out.write("\tif($('input[name=\"uploadFile\"]').length >=5){\r\n");
      out.write("\t\talert(\"파일추가는 5개까지만 가능합니다.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tvar input=$('<input>').attr({\"type\":\"file\",\"name\":\"uploadFile\"}).css(\"display\",\"inline\"); \r\n");
      out.write("\tvar div=$('<div>').addClass(\"inputRow\");\r\n");
      out.write("\tdiv.append(input).append(\"<button style='border:0;outline:0;' class='button button-outline button-round button-warning' type='button'>X</button\");\r\n");
      out.write("\tdiv.appendTo('.fileInput');\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("$('div.fileInput').on('click','div.inputRow > button',function(event){\r\n");
      out.write("\t$(this).parent('div.inputRow').remove();\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("$('.fileInput').on('change','input[type=\"file\"]',function(event){\r\n");
      out.write("\tif(this.files[0].size>1024*1024*40){\r\n");
      out.write("\t\talert(\"파일 용량이 40MB를 초과하였습니다.\");\r\n");
      out.write("\t\tthis.value=\"\";\r\n");
      out.write("\t\t$(this).focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t} \r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
