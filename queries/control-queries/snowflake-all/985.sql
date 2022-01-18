select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,warehouse w,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 423 and ws.ws_hash <= 756 and cd.cd_hash >= 372 and cd.cd_hash <= 772 and c.c_hash >= 120 and c.c_hash <= 870
;
