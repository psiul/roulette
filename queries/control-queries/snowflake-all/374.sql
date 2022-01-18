select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer c,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 416 and d.d_hash <= 749 and c.c_hash >= 230 and c.c_hash <= 630 and cd.cd_hash >= 236 and cd.cd_hash <= 986
;
