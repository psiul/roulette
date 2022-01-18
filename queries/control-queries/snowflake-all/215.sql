select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer c,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 240 and ws.ws_hash <= 640 and d.d_hash >= 115 and d.d_hash <= 865 and cd.cd_hash >= 354 and cd.cd_hash <= 687
;
