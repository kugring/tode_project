<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta name="viewport" content="initial-scale=1, width=device-width">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto Sans KR:wght@300;500&display=swap"/>
    <link href="${path}/resources/follow/style.css" type="text/css" rel="stylesheet"/>
    <link href="${path}/resources/app.css" type="text/css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${path}/resources/follow/script.js"></script>
</head>
<body>
<div class="follow-page">
    <div class="follow-container">
        <div class="follow-header">
            <div class="black-left-arrow icon-32"></div>
            <div class="follow-title emphasis">팔로우</div>
            <div class="icon-32"></div>
        </div>
        <div class="follow-title">
            <div class="follow-page-button follower-button">
                <div class="emphasis follower-int">4</div>
                <div class="emphasis">팔로워</div>
            </div>
            <div class="follow-page-button following-button selected">
                <div class="emphasis follower-int">7</div>
                <div class="emphasis">팔로잉</div>
            </div>
        </div>

        <c:forEach items="${followerVo}" var="followerItem">
            <div class="follower-list">
                <div class="follower-item">
                    <div class="profile-box">
                        <div class="profile-image icon-40"></div>
                        <div class="emphasis">${followerItem.email}</div>
                    </div>
                    <div class="follow-more">
                        <div class="follow-button">
                            <div class="emphasis">팔로우</div>
                        </div>
                        <div class="follower-delete-modal-button">
                            <div class="black-width-menu icon-16 op-5"></div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:forEach items="${followingVo}" var="followingItem">
            <div class="following-list">
                <div class="following-item">
                    <div class="profile-box">
                        <div class="profile-image icon-40"></div>
                        <div class="emphasis">${followingItem.followEmail}</div>
                    </div>
                    <div class="unfollow-modal-button">
                        <div class="black-width-menu icon-16 op-5"></div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- ////////////////////////////////////////////////////////////////모달//////////////////////////////////////////////////////////////// -->
<div class="follow-black-modal"></div>

<div class="unfollow-modal">
    <div class="follow-tile">
        <div class="gray-slice-bar"></div>
        <div class="follow-profile">
            <div class="white-default-profile icon-60"></div>
            <div class="emphasis">팔로워_닉네임</div>
        </div>
    </div>

    <div class="divider"></div>

    <div class="unfollow-item">
        <div class="empty-black-man-off icon-22 op-7"></div>
        <div class="emphasis">언팔로우</div>
    </div>
</div>

<div class="follower-delete-modal">
    <div class="follower-delete-button">
        <div class="emphasis">팔로워 삭제</div>
    </div>
    <div class="cancel-button">
        <div class="emphasis">취소</div>
    </div>
</div>


</body>
</html>
