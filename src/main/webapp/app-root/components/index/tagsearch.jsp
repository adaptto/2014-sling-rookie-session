<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>

<%-- Extract tag name from suffix (remove leading slash), and build XPath query --%>
<c:set var="tagName" value="${fn:substring(slingRequest.requestPathInfo.suffix,1,100)}"/>
<c:set var="xpathQuery" value="/jcr:root${resource.path}//*[tags='${tagName}']"/>

<html>

  <sling:call script="html_head.jsp"/>

  <body>

    <h1>adaptTo() Rookie Demo - Search by tag: <c:out value="${tagName}"/></h1>

    <%-- Execute XPath query and display results --%>
    <sling:findResources var="searchResult" query="${xpathQuery}" language="xpath"/>
    <ul>
      <c:forEach var="child" items="${searchResult}">
        <sling:adaptTo var="props" adaptable="${child}" adaptTo="org.apache.sling.api.resource.ValueMap"/>
        <li>
          <a href="${child.path}.html"><c:out value="${props['jcr:title']}"/></a>
        </li>
      </c:forEach>
    </ul>

    <p><a href="${resource.path}.html">Back to parent</a></p>

  </body>
</html>
