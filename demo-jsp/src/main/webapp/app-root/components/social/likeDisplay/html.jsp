<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>
<sling:adaptTo var="props" adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap"/>

<%-- Get number of likes --%>
<sling:getProperty var="likes" properties="${props}" key="likes" defaultValue="0" returnClass="Long.class" />

<%-- "Like me" button which posts to special POST servlet --%>
<form action="${resource.path}.likeme.html" method="POST">
Likes: ${likes}
<input type="submit" value="Like me"/>
</form>
