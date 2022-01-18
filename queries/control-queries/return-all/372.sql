select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,warehouse w,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 136 and ws.ws_hash <= 469 and sm.sm_hash >= 491 and sm.sm_hash <= 891 and c.c_hash >= 65 and c.c_hash <= 815
;
