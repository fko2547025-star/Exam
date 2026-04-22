<%@page contentType="text/html; charset=UTF-8" %>

<jsp:include page="/header.jsp" />


<!-- css -->
<style>
  body {
    margin: 0;
    font-family: "Segoe UI", sans-serif;
  }

  .layout {
    display: flex;
    min-height: 100vh;
  }

  /* --- サイドバー（白背景＋青リンク） --- */
.sidebar {
  width: 180px;
  background-color: #ffffff;
  border-right: 1px solid #ccc;
  height: 100vh;
  padding: 20px 10px;
  margin-left: 100px;
  box-sizing: border-box;
}

.sidebar ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

.sidebar li {
  margin: 0;
  padding: 0;
}

/* リンク（青文字） */
.sidebar a {
  display: block;
  margin: 12px 0;
  color: #0070c0;
  text-decoration: none;
  font-size: 15px;
}

.sidebar a:hover {
  text-decoration: underline;
}

/* 成績管理  分類:label 種別:li (アイテムリスト) */
.sidebar li.label {
  color: #000001;
  background-color: #ffffff;
  font-weight: normal;
  cursor: default;
}

.sidebar li.child {
  padding-left: 15px;
}

  
  /* --- メイン --- */
.main-menu {
  display: flex;
  gap: 20px;
  margin-top: 20px;
  margin-left: 10px;
}

.menu-block {
  width: 200px;
  padding: 15px;
  border: 1px solid #000; 
  background-color: #fff;
  border-radius: 4px;
  box-sizing: border-box;
}

.menu-block .title {
  font-size: 18px;
  font-weight: normal;
  margin-bottom: 10px;
}

.menu-block .title a {
  color: #0070c0; 
  text-decoration: none;
}

.menu-block .title2 a {
  color: #000001; 
  text-decoration: none;
}

.menu-block .title a:hover {
  text-decoration: underline;
}

/* 子（成績登録・成績参照） */
.child-menu a {
  display: block;
  color: #0070c0;
  text-decoration: none;
  margin: 5px 0;
  font-size: 14px;
}

.child-menu a:hover {
  text-decoration: underline;
}

</style>

      <!-- メニュー , 学生管理 , 成績登録 , 成績参照 , 科目管理 は
      		分類: link  種別: a 　によりリンクの表示               -->
      
      <!-- 成績管理だけ　分類: label 　種別: li -->

<div class="layout">

  <!-- ▼ サイドバー -->
  <aside class="sidebar">
    <nav>
      <ul>
   
        <li><a href="menu.jsp">メニュー</a></li>

        <li><a href="student_list.jsp">学生管理</a></li>

        <li class="label">成績管理</li>
        
        <li class="child"><a href="test_regist.jsp">成績登録</a></li>
        
        <li class="child"><a href="test_list.jsp">成績参照</a></li>
        
        <li><a href="SubjectList.action">科目管理</a></li>
        
      </ul>
    </nav>
  </aside>

  <!-- メイン -->
<main class="main">

  <h2>メニュー</h2>

  <div class="main-menu">

    
    <div class="menu-block">
      <div class="title">
        <a href="student_list.jsp">学生管理</a>
      </div>
    </div>

    <!-- 親 (成績管理) 子 (成績登録　, 成績参照) -->
    <div class="menu-block">
      <div class="title2">成績管理</div>
      <div class="child-menu">
        <a href="test_regist.jsp">成績登録</a>
        <a href="test_list.jsp">成績参照</a>
      </div>
    </div>

    <div class="menu-block">
      <div class="title">
        <a href="SubjectList.action">科目管理</a>
      </div>
    </div>

  </div>

</main>


</div>

<jsp:include page="/footer.html" />
