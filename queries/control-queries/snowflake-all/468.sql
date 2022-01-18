select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,customer_demographics cd,date_dim d
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 492 and ws.ws_hash <= 825 and c.c_hash >= 334 and c.c_hash <= 734 and d.d_hash >= 217 and d.d_hash <= 967
;
