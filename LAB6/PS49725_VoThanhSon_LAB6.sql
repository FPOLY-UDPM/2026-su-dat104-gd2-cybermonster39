-- ==================== BÀI 1 ====================
----Doanh thu theo danh mục sản phẩm qua các năm

SELECT 
    c.category_name AS DanhMuc,                                         
    YEAR(o.order_date) AS Nam,
    (i.list_price * i.quantity * (1 - i.discount)) AS DoanhThuDong
INTO 
    ThongKeDoanhThu
FROM 
    sales.orders o
JOIN 
    sales.order_items i ON o.order_id = i.order_id
JOIN 
    production.products p ON i.product_id = p.product_id
JOIN 
    production.categories c ON p.category_id = c.category_id;

SELECT 
    DanhMuc, 
    [2016],   
    [2017], 
    [2018]
FROM 
    ThongKeDoanhThu
PIVOT (
    SUM(DoanhThuDong)
    FOR Nam IN ([2016], [2017], [2018])
) AS BangPivot;

--------------------bai2-----------------
SELECT
    DanhMuc,
    NhomDoanhThu,
    [2016],
    [2017],
    [2018]
FROM
(
    SELECT
        c.category_name AS DanhMuc,
        YEAR(o.order_date) AS Nam,
        i.list_price * i.quantity * (1-i.discount) AS DoanhThuDong,
        CASE
            WHEN i.list_price * i.quantity * (1-i.discount) >= 1000 THEN 'Cao'
            ELSE 'Thap'
        END AS NhomDoanhThu
    FROM sales.orders o
    JOIN sales.order_items i
        ON o.order_id = i.order_id
    JOIN production.products p
        ON i.product_id = p.product_id
    JOIN production.categories c
        ON p.category_id = c.category_id
) AS BangTam
PIVOT
(
    SUM(DoanhThuDong)
    FOR Nam IN ([2016],[2017],[2018])
) AS BangPivot;



-----------------cau3(excel)------------------