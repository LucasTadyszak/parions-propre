<%--
  Created by IntelliJ IDEA.
  User: lucastadyszak
  Date: 17/02/2021
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="templates/header.jsp" %>
<%@ include file="templates/menu.jsp" %>

    <h1>Tests JDBC</h1>

    <c:forEach items="${ messages }" var="message" varStatus="boucle">
        <p>${ boucle.count }. ${ message }</p>
    </c:forEach>

<%@ include file="templates/footer.jsp" %>