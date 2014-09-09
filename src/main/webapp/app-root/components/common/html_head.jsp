<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>

<sling:defineObjects/>
<sling:adaptTo var="props" adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap"/>

<head>
  <title><c:out value="${props['jcr:title']}"/></title>
  <link href="/apps/rookiedemo/docroot/css/normalize.css" rel="stylesheet" />
  <link href="/apps/rookiedemo/docroot/css/styles.css" rel="stylesheet" />
</head>
