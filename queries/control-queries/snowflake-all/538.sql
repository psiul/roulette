select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,warehouse w,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 266 and ws.ws_hash <= 666 and cd.cd_hash >= 247 and cd.cd_hash <= 997 and c.c_hash >= 87 and c.c_hash <= 420
;
