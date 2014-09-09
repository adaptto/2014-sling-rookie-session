<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>

<ul>

  <%-- Iterate over all child resources from current resource --%>
  <sling:listChildren var="children" resource="${resource}"/>
  <c:forEach var="child" items="${children}">
    <sling:adaptTo var="props" adaptable="${child}" adaptTo="org.apache.sling.api.resource.ValueMap"/>
    <li>
      <a href="${child.path}.html"><c:out value="${props['jcr:title']}"/></a>
    </li>
  </c:forEach>

</ul>
