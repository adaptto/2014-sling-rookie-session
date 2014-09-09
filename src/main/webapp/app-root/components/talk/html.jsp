<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>
<sling:adaptTo var="props" adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap"/>

<html>

  <%-- Include html_head script inherited from super component "common" --%>
  <sling:call script="html_head.jsp"/>

  <body>

    <%-- Output talk properties --%>
    <h1><c:out value="${props['jcr:title']}"/></h1>
    <p><c:out value="${props['jcr:description']}"/></p>
    <p><em><c:out value="${props.speaker}"/>, ${props.durationMin} min</em></p>

    <%-- Link to vCalendar view of talk --%>
    <p><a href="${resource.path}.vcs">Add to my calender</a></p>

    <%-- Include like my function --%>
    <sling:include resourceType="/apps/rookiedemo/components/social/likeDisplay"/>

    <p>
      <a href="${resource.parent.path}.html">Back to parent</a>

      <%-- Integrate java-based sling component via it's resource type to render previous/next links --%>
      <sling:include resourceType="/apps/rookiedemo/components/resourceSiblingNavigator"/>

    </p>

    <hr/>

    <%-- Include discussion sling component via it's resource type --%>
    <h3>Discussion</h3>
    <sling:include resourceType="/apps/rookiedemo/components/social/commentList"/>

  </body>
</html>
