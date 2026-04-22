<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/header.html"/>
<section class="me-4">

    <h2 class="h3 mb-4 fw-normal bg-secondary bg-opacity-10 py-2 px-4 mt-3">
        科目情報変更
    </h2>

    <form action="SubjectUpdateExecute.action" method="post" class="px-4">

        <div class="mb-4">
            <label class="form-label fw-bold">科目コード</label>
            <input type="text" class="form-control" value="${subject.cd}" disabled>

            <input type="hidden" name="cd" value="${subject.cd}">
        </div>

        <div class="mb-4">
            <label class="form-label fw-bold">科目名</label>
            <input type="text" name="name" class="form-control"
                   value="${subject.name}">
        </div>

        <div class="mt-4">
            <button type="submit" class="btn btn-primary px-4">変更</button>
            <a href="SubjectList.action" class="btn btn-secondary px-4 ms-2">戻る</a>
        </div>

    </form>

</section>
