<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - メインメニュー</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- ナビバー -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold">得点管理システム</span>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="Menu.action">ホーム</a></li>
                <li class="nav-item"><a class="nav-link" href="StudentList.action">学生管理</a></li>
                <li class="nav-item"><a class="nav-link" href="TestList.action">成績管理</a></li>
                <li class="nav-item"><a class="nav-link" href="ClassList.action">クラス管理</a></li>

                <!-- ▼ ログイン状態で表示を切り替え -->
                <c:choose>
                    <c:when test="${not empty loginUserName}">
                        <li class="nav-item">
                            <span class="nav-link text-white">ようこそ、${loginUserName} 様</span>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="Logout.action">ログアウト</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="Login.action">ログイン</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- ▼ ログアウト後メッセージ -->
<c:if test="${not empty logoutMessage}">
    <div class="alert alert-info text-center m-0">
        ${logoutMessage}
    </div>
</c:if>

<!-- メインコンテンツ -->
<div class="container mt-4">
    <h2 class="h3 mb-4 fw-normal bg-secondary bg-opacity-10 py-2 px-4">メインメニュー</h2>

    <div class="row g-3 mb-4">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">学生一覧</h5>
                    <p class="card-text text-muted">学生情報の一覧を確認</p>
                    <a href="StudentList.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">学生登録</h5>
                    <p class="card-text text-muted">新しい学生を登録</p>
                    <a href="StudentCreate.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">成績登録</h5>
                    <p class="card-text text-muted">学生の成績を登録</p>
                    <a href="TestRegist.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">成績参照</h5>
                    <p class="card-text text-muted">成績を検索・確認</p>
                    <a href="TestList.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">科目管理</h5>
                    <p class="card-text text-muted">科目情報の一覧・編集</p>
                    <a href="SubjectList.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>

        <!-- ▼ クラス管理カード -->
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">クラス管理</h5>
                    <p class="card-text text-muted">クラス情報の一覧・編集</p>
                    <a href="ClassList.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title fw-bold">ユーザ管理</h5>
                    <p class="card-text text-muted">ユーザ情報の一覧・編集</p>
                    <a href="TeacherList.action" class="btn btn-outline-primary">開く</a>
                </div>
            </div>
        </div>
    </div>

    <!-- お知らせと最近の成績入力 -->
    <div class="row">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white fw-bold">お知らせ</div>
                <div class="card-body">
                    <ul class="list-unstyled mb-0">
                        <li>・期末テストの採点は今週末までに完了してください</li>
                        <li>・新年度のクラス編成が決定しました</li>
                        <li>・システムメンテナンス: 4月5日 18:00〜20:00</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white fw-bold">最近の成績入力</div>
                <div class="card-body">
                    <table class="table table-sm table-striped mb-0">
                        <thead>
                            <tr>
                                <th>日付</th>
                                <th>クラス</th>
                                <th>テスト</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr><td>2024/04/10</td><td>101</td><td>英語 第1回</td></tr>
                            <tr><td>2024/04/08</td><td>202</td><td>数学 期末</td></tr>
                            <tr><td>2024/04/05</td><td>103</td><td>理科 中間</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
