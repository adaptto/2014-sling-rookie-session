<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>

<%-- Search all talks with the given tag name using a Sling Model --%>
<sling:adaptTo var="search" adaptable="${slingRequest}" adaptTo="org.adaptto.rookie.jspdemo.models.TagSearchController"/>

<html>

  <sling:call script="html_head.jsp"/>

  <body>

    <h1>adaptTo() Rookie Demo - Search by tag: <c:out value="${search.tag}"/></h1>

    <%-- Display search results --%>
    <ul>
      <c:forEach var="child" items="${search.result}">
        <sling:adaptTo var="props" adaptable="${child}" adaptTo="org.apache.sling.api.resource.ValueMap"/>
        <li>
          <a href="${child.path}.html"><c:out value="${props['jcr:title']}"/></a>
        </li>
      </c:forEach>
    </ul>

    <p><a href="${resource.path}.html">Back to parent</a></p>

  </body>
</html>
