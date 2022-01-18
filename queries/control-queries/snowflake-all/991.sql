select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer_demographics cd,customer c
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 129 and ws.ws_hash <= 462 and d.d_hash >= 206 and d.d_hash <= 956 and cd.cd_hash >= 221 and cd.cd_hash <= 621
;
