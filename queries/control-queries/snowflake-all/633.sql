select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,customer c,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 181 and ws.ws_hash <= 931 and d.d_hash >= 486 and d.d_hash <= 886 and c.c_hash >= 155 and c.c_hash <= 488
;
