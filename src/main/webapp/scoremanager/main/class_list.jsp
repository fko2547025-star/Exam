<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="/header.jsp"/>

<div class="layout">

  <!-- ▼ サイドバー -->
  <aside class="sidebar">
    <nav>
      <ul>
   
        <li><a href="Menu.action">メニュー</a></li>

        <li><a href="StudentList.action">学生管理</a></li>

        <li class="label">成績管理</li>
        
        <li class="child"><a href="test_regist.jsp">成績登録</a></li>
        
        <li class="child"><a href="test_list.jsp">成績参照</a></li>
        
        <li><a href="subject_list.jsp">科目管理</a></li>
        
      </ul>
    </nav>
  </aside>
<section class="me-4">

    <h2 class="h3 mb-3 fw-normal bg-secondary bg-opacity-10 py-2 px-4 mt-3">
        クラス管理
    </h2>

    <div class="text-end mb-3 px-4">
        <a href="class_create.jsp" class="btn btn-secondary">新規登録</a>
    </div>

    <div class="px-4">
        <table class="table table-bordered align-middle">
            <thead class="table-light">
                <tr>
                    <th>クラス番号</th>
                    <th style="width: 10%">変更</th>
                    <th style="width: 10%">削除</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td>${s}</td>
						<td>
						    <a href="ClassUpdate.action?cd=${s}" class="text-primary fw-bold">
						        変更
						    </a>
						</td>
						<td>
						    <a href="ClassDelete.action?cd=${s}" class="text-danger fw-bold">
						        削除
						    </a>
						</td>
                    </tr>
                </c:forEach>

                <c:if test="${empty list}">
                    <tr>
                        <td colspan="4" class="text-center py-4">
                            クラス情報が存在しませんでした。
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</section>
</div>
<style>
.sidebar {
    width: 200px;
    position: fixed;
    top: 60px; /* header の高さに合わせる */
    left: 0;
    height: 100%;
    background-color: #ffffff;
    padding: 20px;
}

section.me-4 {
    margin-left: 220px; /* サイドバーの幅 + 余白 */
}
</style>
