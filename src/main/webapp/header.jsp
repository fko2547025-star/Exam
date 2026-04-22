<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<title>得点管理システム</title>

<header class="header-area">

    <!-- 全画面共通ヘッダー -->
    <h1 class="page-title">得点管理システム</h1>

    <div class="header-right">

        <!-- ▼ ログインしていない時だけログインボタンを表示 -->
        <c:if test="${empty loginUserName}">
            <a href="<%= request.getContextPath() %>/Login.action" class="logout-link">ログイン</a>
        </c:if>

        <!-- ▼ ログイン後のみ表示 -->
        <c:if test="${not empty loginUserName}">
            <span class="login-user">${loginUserName} 様</span>
            <a href="<%= request.getContextPath() %>/Logout.action" class="logout-link">ログアウト</a>
        </c:if>

    </div>

</header>

<style>
    .header-area {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 20px;
        margin-left: 100px;
        border-bottom: 1px solid #ccc;
    }

    .page-title {
        font-size: 24px;
        margin: 0;
    }

    .header-right {
        display: flex;
        align-items: center;
    }

    .login-user {
        margin-right: 20px;
        font-weight: bold;
    }

    .logout-link {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        margin-left: 15px;
    }
</style>

