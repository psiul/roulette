select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,customer_demographics cd,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 631 and ws.ws_hash <= 964 and c.c_hash >= 542 and c.c_hash <= 942 and cd.cd_hash >= 42 and cd.cd_hash <= 792
;
