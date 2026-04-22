<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/header.html"/>
<section class="me-4">

    <!-- タイトル（薄グレー背景） -->
    <h2 class="h3 mb-4 fw-normal bg-secondary bg-opacity-10 py-2 px-4 mt-3">
        科目情報削除
    </h2>

    <div class="px-4">

        <!-- 削除確認メッセージ -->
        <p class="fs-5">
            『${subject.name}（${subject.cd}）』を削除してもよろしいですか
        </p>

        <!-- 削除フォーム -->
        <form action="SubjectDeleteExecute.action" method="post" class="mt-4">

            <!-- 削除対象の科目コードを送る -->
            <input type="hidden" name="cd" value="${subject.cd}">

            <!-- ボタン（左：削除、右：戻る） -->
            <button type="submit" class="btn btn-danger px-4">削除</button>
            <a href="SubjectList.action" class="btn btn-secondary px-4 ms-2">戻る</a>

        </form>

    </div>

</section>
