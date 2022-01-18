select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,customer c,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 121 and ws.ws_hash <= 871 and sm.sm_hash >= 423 and sm.sm_hash <= 823 and cd.cd_hash >= 61 and cd.cd_hash <= 394
;
