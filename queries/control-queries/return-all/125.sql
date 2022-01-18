select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,customer_demographics cd,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 133 and ws.ws_hash <= 466 and d.d_hash >= 18 and d.d_hash <= 768 and c.c_hash >= 417 and c.c_hash <= 817
;
