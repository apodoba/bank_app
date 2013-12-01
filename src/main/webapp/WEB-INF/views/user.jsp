<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title><spring:message code="label.app_title" /></title>
</head>
<body>

	<%-- <h2><spring:message code="label.welcome_title" />, 
		 <spring:message code="label.login" />		
	</h2>--%>

	<c:if test="${!empty userProfile}">
		<h3>
			<spring:message code="label.profile" />
		</h3>
		<table class="data">
			<tr>
				<td><spring:message code="label.fullname" /></td>
				<td>${userProfile.getFullName()}</td>
			</tr>
			<tr>
				<td><spring:message code="label.username" /></td>
				<td>${userProfile.getUserName()}</td>
			</tr>
			<tr>
				<td><spring:message code="label.email" /></td>
				<td>${userProfile.getEmail()}</td>
			</tr>
			<tr>
				<td><spring:message code="label.telephone" /></td>
				<td>${userProfile. getPhone()}</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${!empty userProfile && !empty userAccount}">
		<h3>
			<spring:message code="label.account" />
		</h3>
		<table class="data">
			<tr>
				<td><spring:message code="label.accountNumber" /></td>
				<td>${userAccount.getName()}</td>
			</tr>
			<tr>
				<td><spring:message code="label.accountBalance" /></td>
				<td>${userAccount.getBalance()}</td>
				<td>${userAccount.getCurrencyType().getName()}</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${!empty services}">
		<h3>
			<spring:message code="label.service.payment" />
		</h3>
		<form:form method="post" action="decreaseBalanceService"
			commandName="money">
			<table class="data">
				<tr>
					<td><b><spring:message code="label.service" /></b></td>
					<td><c:set var="selectedService" value="${selectedService}" />
						<c:set var="selectedFlag" value="${!empty selectedService}" /> <select
						name=locale>
							<c:forEach var="lservice" items="${services}">
								<c:choose>
									<c:when test="${selectedFlag}">
										<c:choose>
											<c:when
												test="${lservice.getName().equals(selectedService.getName())}">
												<option selected>${lservice.getName()}</option>
											</c:when>
											<c:otherwise>
												<option>${lservice.getName()}</option>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<option>${lservice.getName()}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td><spring:message code="label.money" /></td>
					<td><input type="text" style="width: 100px;" name="money" />
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit"
						value="<spring:message code="label.addcontact"/>" /></td>
				</tr>
			</table>
		</form:form>

	</c:if>
	<c:if test="${userAdmin}">
		<a href="<c:url value="/allUsers" />"> <spring:message
				code="label.allUsers" />
		</a>
		<br />
	</c:if>


	<br />
	<br />
	<!-- <td><a href="change/${user.id}"><spring:message code="label.changeProfile" /></a></td>-->

	<a href="<c:url value="/logout" />"> <spring:message
			code="label.logout" /></a>


</body>
</html>
