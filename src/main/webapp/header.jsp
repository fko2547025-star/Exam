<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>得点管理システム - メインメニュー</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    
    <link href="https://fonts.googleapis.com/css2?family=Rounded+Mplus+1c:wght@400;500;700;900&display=swap" rel="stylesheet">
    

    <!-- ▼ カードホバー効果 -->
    <style>
        .card-hover {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            cursor: pointer;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        }
        .card-hover i {
            transition: 0.2s;
        }
        .card-hover:hover i {
            transform: scale(1.15);
        }
	    body {
	        font-family: "Rounded Mplus 1c", "Hiragino Maru Gothic ProN", "Yu Gothic", sans-serif;
	        font-weight: 700; /* ← 太字をデフォルトに */
	    }
    </style>
    
    <body style="
    background: linear-gradient(
        135deg,
        #fafafa 0%,   /* ほぼ白 */
        #f2f2f2 40%,  /* 薄いグレー */
        #e6e6e6 100%  /* 少しだけ暗いグレー */
    );
">
<style>
.section-title {
    background: linear-gradient(135deg, #bbdefb, #e3f2fd); /* カードと同じ薄い青 */
    color: #000000; /* 黒文字 */
    padding: 12px 20px;
    border-radius: 8px;
    font-weight: 700;
    margin-bottom: 25px;

    /* ▼ 文字の縁取り（白） */
    -webkit-text-stroke: 1px #ffffff;
    text-stroke: 1px #ffffff;
}

</style>
    




