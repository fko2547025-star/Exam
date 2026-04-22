<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/header.html"/>
<section class="me-4">

    <!-- タイトル（写真どおり薄グレー背景） -->
    <h2 class="h3 mb-4 fw-normal bg-secondary bg-opacity-10 py-2 px-4 mt-3">
        科目情報登録
    </h2>

    <form action="SubjectCreateExecute.action" method="post" class="px-4">

        <!-- 科目コード -->
        <div class="mb-4">
            <label class="form-label fw-bold">科目コード</label>
            <input type="text" name="cd" class="form-control"
                   value="${cd}" placeholder="科目コードを入力してください">

            <!-- エラー表示（未入力・文字数・重複など） -->
            <c:if test="${not empty errorCd}">
                <div class="text-danger mt-1">${errorCd}</div>
            </c:if>
        </div>

        <!-- 科目名 -->
        <div class="mb-4">
            <label class="form-label fw-bold">科目名</label>
            <input type="text" name="name" class="form-control"
                   value="${name}" placeholder="科目名を入力してください">

            <!-- エラー表示 -->
            <c:if test="${not empty errorName}">
                <div class="text-danger mt-1">${errorName}</div>
            </c:if>
        </div>

        <!-- ボタン（写真どおり左：登録、右：戻る） -->
        <div class="mt-4">
            <button type="submit" class="btn btn-primary px-4">登録</button>
            <a href="SubjectList.action" class="btn btn-secondary px-4 ms-2">戻る</a>
        </div>

    </form>

</section>
