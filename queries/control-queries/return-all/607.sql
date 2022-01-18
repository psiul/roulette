select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_demographics cd,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 39 and ws.ws_hash <= 439 and c.c_hash >= 121 and c.c_hash <= 454 and cd.cd_hash >= 92 and cd.cd_hash <= 842
;
