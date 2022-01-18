select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,warehouse w,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 288 and ws.ws_hash <= 621 and sm.sm_hash >= 190 and sm.sm_hash <= 940 and c.c_hash >= 292 and c.c_hash <= 692
;
