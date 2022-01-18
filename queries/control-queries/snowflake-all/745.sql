select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,warehouse w,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 55 and ws.ws_hash <= 805 and c.c_hash >= 40 and c.c_hash <= 373 and d.d_hash >= 426 and d.d_hash <= 826
;
