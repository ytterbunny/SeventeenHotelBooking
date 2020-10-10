<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <!-- header nav bar -->
    <jsp:include page="adminHeader.jsp" />

    <section class="home-slider owl-carousel">
        <div class="slider-item"
             style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
            <div class="overlay"></div>
            <div class="container">
                <div
                        class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-12 ftco-animate text-center">
                        <div class="text mb-5 pb-3">
                            <h1 class="mb-3">Room Management</h1>
                            <h2>View & Edit Room</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <h2>Editing Status</h2>
                </div>
            </div>
            <div class="container">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <div class="row justify-content-center mb-5 pb-3">
                                <div class="col-md-7 heading-section text-center ftco-animate">
                                    <h3>Available Rooms</h3>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <th scope="col">Room Id</th>
                            <th scope="col">Room Number</th>
                            <th scope="col">Price</th>
                            <th scope="col">Status</th>
                            <th scope="col">Room Type</th>
                            <th scope="col">Max Capacity</th>
                            <th scope="col">Check in</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="room" items="${roomList}">
                            <c:url var="checkinLink" value="/adminRoom/checkin">
                                <c:param name="roomId" value="${room.roomId}"/>
                            </c:url>
                            <tr>
                                <td>${room.roomId}</td>
                                <td>${room.roomNumber}</td>
                                <td>${room.roomPrice}</td>
                                <td>${room.roomType}</td>
                                <td>${room.maxCapacity}</td>
                                <td>${room.roomStatus}</td>
                                <td><a href="${checkinLink}">Check in</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
                <table class="table table-hover">
                    <tr>
                        <div class="row justify-content-center mb-5 pb-3">
                            <div class="col-md-7 heading-section text-center ftco-animate">
                                <h3>Reservation Requests</h3>
                            </div>
                        </div>
                    </tr>
                    <tr>
                        <th>Reservation Id</th>
                        <th>Room Id</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Bill</th>
                        <th>Status</th>
                        <th>Edit Status</th>
                    </tr>
                    <c:forEach var="reservation" items="${reservationList}">
                        <c:url var="checkinLink" value="/adminRoom/reservation/checkin">
                            <c:param name="reservationId" value="${reservation.reservationId}"/>
                        </c:url>
                        <c:url var="checkoutLink" value="/adminRoom/reservation/checkout">
                            <c:param name="reservationId" value="${reservation.reservationId}" />
                        </c:url>
                        <tr>
                            <td>${reservation.reservationId}</td>
                            <td>${reservation.roomId}</td>
                            <td>${reservation.checkinTime}</td>
                            <td>${reservation.checkoutTime}</td>
                            <td>${reservation.totalBill}</td>
                            <td>${reservation.reservationStatus}</td>
                            <c:choose>
                                <c:when test="${reservation.reservationStatus.equals('Pending')}">
                                    <td><a href=${checkinLink}>Check In</a></td>
                                </c:when>
                                <c:otherwise>
                                    <td><a href=${checkoutLink}>Check Out</a></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                </table>
                <table class="table table-hover">
                    <div class="row justify-content-center mb-5 pb-3">
                        <div class="col-md-7 heading-section text-center ftco-animate">
                            <h3>Non-Available Rooms</h3>
                        </div>
                    </div>
                    <tr>
                        <th scope="col">Room Id</th>
                        <th scope="col">Room Number</th>
                        <th scope="col">Price</th>
                        <th scope="col">Room Type</th>
                        <th scope="col">Max Capacity</th>
                        <th scope="col">Status</th>
                        <th scope="col">Edit Status</th>
                    </tr>
                    <c:forEach var="room" items="${nonAvailableList}">
                        <c:url var="editRoomStatus" value="/adminRoom/editStatus">
                            <c:param name="roomId" value="${room.roomId}"/>
                        </c:url>
                        <tr>
                            <td>${room.roomId}</td>
                            <td>${room.roomNumber}</td>
                            <td>${room.roomPrice}</td>
                            <td>${room.roomType}</td>
                            <td>${room.maxCapacity}</td>
                            <td>${room.roomStatus}</td>
                            <td><a href="${editRoomStatus}">Edit</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </section>
    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section text-center ftco-animate">
                    <h2>Delete Room</h2>
                </div>
            </div>
            <div class="container">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <div class="row justify-content-center mb-5 pb-3">
                                <div class="col-md-7 heading-section text-center ftco-animate">
                                    <h3>All Rooms</h3>
                                </div>
                            </div>
                        </tr>
                        <tr>
                            <th scope="col">Room Id</th>
                            <th scope="col">Room Number</th>
                            <th scope="col">Price</th>
                            <th scope="col">Status</th>
                            <th scope="col">Room Type</th>
                            <th scope="col">Max Capacity</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="room" items="${allRooms}">
                            <c:url var="deleteLink" value="/adminRoom/delete">
                                <c:param name="roomId" value="${room.roomId}"/>
                            </c:url>
                            <tr>
                                <td>${room.roomId}</td>
                                <td>${room.roomNumber}</td>
                                <td>${room.roomPrice}</td>
                                <td>${room.roomType}</td>
                                <td>${room.maxCapacity}</td>
                                <td>${room.roomStatus}</td>
                                <td><a href="${deleteLink}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>

    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen">
        <svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
                    stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none"
                    stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
    </div>


    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
    <!-- <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
