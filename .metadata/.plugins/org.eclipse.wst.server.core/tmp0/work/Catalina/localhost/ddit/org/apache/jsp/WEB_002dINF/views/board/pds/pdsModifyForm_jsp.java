/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.57
 * Generated at: 2020-11-15 08:38:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.board.pds;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class pdsModifyForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(4);
    _jspx_dependants.put("jar:file:/C:/soo/A_TeachingMaterial/7.LastProject/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ddit/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/views/board/pds/attach_js.jsp", Long.valueOf(1605428163651L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1602513789311L));
    _jspx_dependants.put("jar:file:/C:/soo/A_TeachingMaterial/7.LastProject/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ddit/WEB-INF/lib/jstl-1.2.jar!/META-INF/fmt.tld", Long.valueOf(1153352682000L));
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005ffmt_005fformatDate_0026_005fvalue_005fpattern_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems;

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
    _005fjspx_005ftagPool_005ffmt_005fformatDate_0026_005fvalue_005fpattern_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005ffmt_005fformatDate_0026_005fvalue_005fpattern_005fnobody.release();
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.release();
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
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- Page Heading End -->\r\n");
      out.write("\t\t<!-- button -->\r\n");
      out.write("\t\t<div style=\"position: absolute; top:25px; right:62px;\">\r\n");
      out.write("\t\t\t<button class=\"button button-success\" id=\"modifyBtn\">\r\n");
      out.write("\t\t\t\t<span>수정</span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<button class=\"button button-info\" id=\"cancelBtn\">\r\n");
      out.write("\t\t\t\t<span>취소</span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- Page Headings End -->\r\n");
      out.write("\r\n");
      out.write("\t<form role=\"form\" method=\"post\" action=\"modify.do\" name=\"modifyForm\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"post_writer\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_writer}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("\t\t\t<input type=\"hidden\" name=\"board_no\" value=\"BOARD005\" />\r\n");
      out.write("\t\t\t<div class=\"col-lg-1 mb-20\"\r\n");
      out.write("\t\t\t\tstyle=\"width: 100%; text-align: center; margin-left:8px; margin-right: -8px; margin-top: 15px;\">\r\n");
      out.write("\t\t\t\t<h5>글번호</h5>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write(" \t\t\t<div class=\"col-lg-3 mb-20\" style=\"width: 100%; margin-left: 0px;\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" readonly=\"readonly\"\r\n");
      out.write("\t\t\t\t\tvalue=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_no }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" id=\"post_no\" name=\"post_no\">\r\n");
      out.write("\t\t\t</div> \r\n");
      out.write("\t\t\t<div class=\"col-lg-1 mb-20\"\r\n");
      out.write("\t\t\t\tstyle=\"width: 100%; text-align: center; margin-right: -8px; margin-top: 15px; margin-left:-7px;\">\r\n");
      out.write("\t\t\t\t<h5>수정일</h5>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-lg-3 mb-20\" style=\"width: 100%; margin-left: 0px;\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" readonly=\"readonly\"\r\n");
      out.write("\t\t\t\t\tvalue='");
      if (_jspx_meth_fmt_005fformatDate_005f0(_jspx_page_context))
        return;
      out.write("'\r\n");
      out.write("\t\t\t\t\tid=\"post_update_date\" name=\"post_update_date\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-lg-1 mb-20\"\r\n");
      out.write("\t\t\t\tstyle=\"width: 100%; text-align: center; margin-right: -8px; margin-top: 15px; margin-left:-7px;\">\r\n");
      out.write("\t\t\t\t<h5>조회수</h5>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"col-lg-3 mb-20\" style=\"width: 100%; margin-left: 0px;\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" readonly=\"readonly\"\r\n");
      out.write("\t\t\t\t\tvalue=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_viewcnt}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" id=\"post_viewcnt\" name=\"post_viewcnt\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-lg-1 mb-25\"\r\n");
      out.write("\t\t\t\tstyle=\"width: 100%; text-align: center; margin-left:10px; margin-right: 0px; margin-top: 12px;\">\r\n");
      out.write("\t\t\t\t<h5>제목</h5>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"col-lg-10.5 mb-20\" style=\"width: 86%; margin-left: 5px;\">\r\n");
      out.write("\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"post_title\"\r\n");
      out.write("\t\t\t\t\tid=\"post_title\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- summernote -->\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"col-12 mb-30\">\r\n");
      out.write("\t\t\t\t<div class=\"box\">\r\n");
      out.write("\t\t\t\t\t<div class=\"box-head\">\r\n");
      out.write("\t\t\t\t\t\t<h3 class=\"title\">내용</h3>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"box-body\">\r\n");
      out.write("\t\t\t\t\t\t<textarea id=\"post_content\" name=\"post_content\" class=\"summernote\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_content }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</textarea>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t<div class=\"fileInput\">\r\n");
      out.write("\t\t\t\t<button type=\"button\"\r\n");
      out.write("\t\t\t\t\tclass=\"button button-outline button-round button-warning\"\r\n");
      out.write("\t\t\t\t\tid=\"addFileBtn\">\r\n");
      out.write("\t\t\t\t\t<i class=\"zmdi zmdi-attachment-alt\"></i> 파일첨부\r\n");
      out.write("\t\t\t\t</button>\r\n");
      out.write("\t\t\t\t<div class=\"inputRow\">\r\n");
      out.write("\t\t\t\t\t<div class=\"attachResult\">\r\n");
      out.write("\t\t\t\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"post_no\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\">\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\t$('#modifyBtn').on('click', function(e) {\r\n");
      out.write("\t\tvar form = document.modifyForm;\r\n");
      out.write("\t\tif (form.post_title.value == \"\") {\r\n");
      out.write("\t\t\talert(\"입력하지 않은 항목이 있습니다.\");\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tform.submit();\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("\t$('#cancelBtn').on('click', function(e) {\r\n");
      out.write("\t\thistory.go(-1);\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("<script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("/*\r\n");
      out.write("$(document).on('click','#addFileBtn',function(){\r\n");
      out.write("\t//alert(\"클릭\");\r\n");
      out.write("\tif($('input[name=\"uploadFile\"]').length >=5){\r\n");
      out.write("\t\talert(\"파일추가는 5개까지만 가능합니다.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\tvar input=$('<input>').attr({\"type\":\"file\",\"name\":\"uploadFile\"}).css(\"display\",\"inline\"); \r\n");
      out.write("\tvar div=$('<div>').addClass(\"inputRow\");\r\n");
      out.write("\tdiv.append(input).append(\"<button style='border:0;outline:0;' class='button button-outline button-round button-warning' type='button'>X</button\");\r\n");
      out.write("\tdiv.appendTo('.fileInput');\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("function deleteAttach(){\r\n");
      out.write("\t$('.inputRow').remove();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("*/\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("$('#addFileBtn').on('click',function(event){\r\n");
      out.write("\tvar attachedFile=$('a[name=\"attachedFile\"]').length;\r\n");
      out.write("\tvar inputFile=$('input[name=\"uploadFile\"]').length;\t\r\n");
      out.write("\tvar attachCount=attachedFile+inputFile;\r\n");
      out.write("\t\r\n");
      out.write("\tif(attachCount >=5){\r\n");
      out.write("\t\talert(\"파일추가는 5개까지만 가능합니다.\");\r\n");
      out.write("\t\treturn;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\tvar input=$('<input>').attr({\"type\":\"file\",\"name\":\"uploadFile\"})\r\n");
      out.write("\t  \t\t\t\t\t  .css(\"display\",\"inline\"); \r\n");
      out.write("\r\n");
      out.write("\tvar div=$('<div>').addClass(\"inputRow\");\r\n");
      out.write("\tdiv.append(input).append(\"<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button\");\r\n");
      out.write("\tdiv.appendTo('.fileInput');\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("$('div.fileInput').on('click','div.inputRow > button',function(event){  \t\t\r\n");
      out.write("\t//alert(\"X btn click;\");\r\n");
      out.write("\t$(this).parent('div.inputRow').remove();\t\r\n");
      out.write("});\r\n");
      out.write("$('.fileInput').on('change','input[type=\"file\"]',function(event){\r\n");
      out.write("\tif(this.files[0].size>1024*1024*40){\r\n");
      out.write("\talert(\"파일 용량이 40MB를 초과하였습니다.\");\r\n");
      out.write("\tthis.value=\"\";\r\n");
      out.write("\t$(this).focus();\r\n");
      out.write("\treturn false;\r\n");
      out.write("} \r\n");
      out.write("});  \r\n");
      out.write("\r\n");
      out.write("$('div.fileInput').on('click','div[name=\"attachedFile\"] > button',function(event){\t\r\n");
      out.write("\tvar parent = $(this).parent('div[name=\"attachedFile\"]');\r\n");
      out.write("\talert(parent.attr(\"attach-fileName\")+\"파일을 삭제합니다.\");\r\n");
      out.write("\t\r\n");
      out.write("\tvar attach_no=parent.attr(\"attach-no\");\r\n");
      out.write("\t\r\n");
      out.write("\t$(this).parents('div.attach-item').remove();\r\n");
      out.write("\t\r\n");
      out.write("\tvar input=$('<input>').attr({\"type\":\"hidden\",\r\n");
      out.write("\t     \"name\":\"deleteFile\",\r\n");
      out.write("\t     \"value\":attach_no\r\n");
      out.write("\t\t }); \r\n");
      out.write("\t$('form[role=\"form\"]').prepend(input);\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\treturn false;\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>");
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

  private boolean _jspx_meth_fmt_005fformatDate_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  fmt:formatDate
    org.apache.taglibs.standard.tag.rt.fmt.FormatDateTag _jspx_th_fmt_005fformatDate_005f0 = (org.apache.taglibs.standard.tag.rt.fmt.FormatDateTag) _005fjspx_005ftagPool_005ffmt_005fformatDate_0026_005fvalue_005fpattern_005fnobody.get(org.apache.taglibs.standard.tag.rt.fmt.FormatDateTag.class);
    boolean _jspx_th_fmt_005fformatDate_005f0_reused = false;
    try {
      _jspx_th_fmt_005fformatDate_005f0.setPageContext(_jspx_page_context);
      _jspx_th_fmt_005fformatDate_005f0.setParent(null);
      // /WEB-INF/views/board/pds/pdsModifyForm.jsp(50,12) name = value type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_fmt_005fformatDate_005f0.setValue((java.util.Date) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${post.post_update_date }", java.util.Date.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      // /WEB-INF/views/board/pds/pdsModifyForm.jsp(50,12) name = pattern type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_fmt_005fformatDate_005f0.setPattern("yyyy-MM-dd");
      int _jspx_eval_fmt_005fformatDate_005f0 = _jspx_th_fmt_005fformatDate_005f0.doStartTag();
      if (_jspx_th_fmt_005fformatDate_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005ffmt_005fformatDate_0026_005fvalue_005fpattern_005fnobody.reuse(_jspx_th_fmt_005fformatDate_005f0);
      _jspx_th_fmt_005fformatDate_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_fmt_005fformatDate_005f0, _jsp_getInstanceManager(), _jspx_th_fmt_005fformatDate_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/views/board/pds/pdsModifyForm.jsp(94,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${!empty post.attachList }", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          if (_jspx_meth_c_005fforEach_005f0(_jspx_th_c_005fif_005f0, _jspx_page_context))
            return true;
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_c_005fif_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f0_reused = false;
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_c_005fif_005f0);
      // /WEB-INF/views/board/pds/pdsModifyForm.jsp(95,7) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/views/board/pds/pdsModifyForm.jsp(95,7) '${post.attachList}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${post.attachList}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      // /WEB-INF/views/board/pds/pdsModifyForm.jsp(95,7) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("attach");
      // /WEB-INF/views/board/pds/pdsModifyForm.jsp(95,7) name = varStatus type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVarStatus("c");
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("<div class=\"attach-item\">\r\n");
            out.write("<div class=\"row\" style=\"cursor: pointer;\" name=\"attachedFile\" attach-fileName=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${attach.attach_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\" attach-no=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${attach.attach_no}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("\">\r\n");
            out.write("\t<!-- \t\t\t\t\t\t\t\t<div class=\"row\" style=\"cursor: pointer;\"onclick=\"deleteAttach()\"> -->\r\n");
            out.write("\t\t\t\t\t\t\t\t\t<span class=\"fa fa-download\">");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${attach.attach_original_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</span>\r\n");
            out.write("\t\t\t\t\t\t\t\t\t<button style=\"border:0; outline:0;\" class=\"button button-outline button-round button-warning\" id=\"delFileBtn\" type=\"button\">X</button>\r\n");
            out.write("\t\t\t\t\t\t\t\t\t<br>\r\n");
            out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
            out.write("\t\t\t\t\t\t\t\t</div>\r\n");
            out.write("\t\t\t\t\t\t\t");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvarStatus_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      _jspx_th_c_005fforEach_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f0_reused);
    }
    return false;
  }
}
