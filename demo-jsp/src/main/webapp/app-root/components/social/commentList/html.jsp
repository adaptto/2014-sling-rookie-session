<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>

<%-- Render all existing comments --%>
<sling:getResource var="discussionResource" path="${resource.path}/discussion"/>
<sling:listChildren var="children" resource="${discussionResource}"/>
<c:forEach var="child" items="${children}">
  <sling:include resource="${child}"/>
</c:forEach>

<%-- Render new comment form --%>
<sling:include resourceType="/apps/rookiejspdemo/components/social/newComment"/>
