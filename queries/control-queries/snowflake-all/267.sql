select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,warehouse w,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 367 and d.d_hash <= 700 and c.c_hash >= 244 and c.c_hash <= 644 and cd.cd_hash >= 59 and cd.cd_hash <= 809
;
