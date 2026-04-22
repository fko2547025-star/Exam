<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/header.html"/>
<section class="me-4">

    <!-- タイトル（薄グレー背景） -->
    <h2 class="h3 mb-4 fw-normal bg-secondary bg-opacity-10 py-2 px-4 mt-3">
        科目情報削除
    </h2>

    <!-- 完了メッセージ（緑色のバー） -->
    <div class="alert alert-success mx-4" role="alert">
        削除が完了しました
    </div>

    <!-- 科目一覧リンク -->
    <div class="px-4 mt-3">
        <a href="SubjectList.action">科目一覧</a>
    </div>

</section>
