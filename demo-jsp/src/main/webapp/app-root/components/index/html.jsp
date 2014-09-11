<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>
<html>

  <%-- Include html_head script inherited from super component "common" --%>
  <sling:call script="html_head.jsp"/>

  <body>

    <h1>adaptTo() Rookie Demo</h1>

    <%-- Include childlist via selector view inherited from super component "common" --%>
    <h2>Overview</h2>
    <sling:include replaceSelectors="childlist"/>

    <%-- Pass query parameter to tagsearch view using Sling suffix --%>
    <h2>Talks by topic</h2>
    <ul>
      <li><a href="${resource.path}.tagsearch.html/Sling">All talks for Sling</a></li>
      <li><a href="${resource.path}.tagsearch.html/JCR">All talks for JCR</a></li>
    </ul>

  </body>
</html>
