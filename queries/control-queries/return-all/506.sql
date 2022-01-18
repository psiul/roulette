select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer_demographics cd,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 319 and ws.ws_hash <= 652 and d.d_hash >= 204 and d.d_hash <= 954 and c.c_hash >= 316 and c.c_hash <= 716
;
