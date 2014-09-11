<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>
<sling:adaptTo var="props" adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap"/>

<html>

  <%-- Include html_head script inherited from super component "common" --%>
  <sling:call script="html_head.jsp"/>

  <body>

    <h1><c:out value="${props['jcr:title']}"/></h1>
    <p><em>${props.durationMin} min</em></p>

    <p>
      <a href="${resource.parent.path}.html">Back to parent</a>

      <%-- Integrate java-based sling component via it's resource type to render previous/next links --%>
      <sling:include resourceType="/apps/rookiedemo/components/resourceSiblingNavigator"/>

    </p>

  </body>
</html>
