select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,customer c,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 219 and ws.ws_hash <= 969 and sm.sm_hash >= 106 and sm.sm_hash <= 506 and c.c_hash >= 183 and c.c_hash <= 516
;
