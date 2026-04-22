<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="../css/login.css">
</head>
<body>

<div class="page-wrapper">

    <header class="header">
        <h1 class="system-name">得点管理システム</h1>
    </header>

    <main class="login-container">

        <h2 class="login-title">ログイン</h2>

        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>

        <form action="LoginExecute.action" method="post">

            <input type="text"
                   name="id"
                   class="input"
                   placeholder="ID">

            <input type="password"
                   name="password"
                   id="password"
                   class="input"
                   placeholder="パスワード">

            <div class="checkbox-area">
                <input type="checkbox" id="showPass">
                <label for="showPass">パスワードを表示</label>
            </div>

            <button type="submit" class="login-btn">ログイン</button>

        </form>

    </main>

    <footer class="footer">
        <small>© 2024 得点管理システム</small>
    </footer>

</div>

<script>
document.getElementById("showPass").addEventListener("change", function() {
    const pw = document.getElementById("password");
    pw.type = this.checked ? "text" : "password";
});
</script>

</body>
</html>
