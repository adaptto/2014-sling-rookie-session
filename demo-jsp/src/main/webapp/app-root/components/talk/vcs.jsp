<%@page contentType="text/calendar; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling"%>
<sling:defineObjects/>
<sling:adaptTo var="props" adaptable="${resource}" adaptTo="org.apache.sling.api.resource.ValueMap"/>

<%-- Output talk details as vCalender to import in mail client --%>
BEGIN:VCALENDAR
VERSION:1.0
BEGIN:VEVENT
DTSTART:${props.startDate}
DTEND:${props.endDate}
DESCRIPTION;ENCODING=QUOTED-PRINTABLE:<c:out value="${props['jcr:description']}"/>
SUMMARY:<c:out value="${props['jcr:title']}"/>
PRIORITY:3
END:VEVENT
END:VCALENDAR
