select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,date_dim d,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and cd.cd_hash >= 144 and cd.cd_hash <= 894 and d.d_hash >= 55 and d.d_hash <= 455 and c.c_hash >= 323 and c.c_hash <= 656
;
