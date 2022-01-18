select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,warehouse w,ship_mode sm
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 597 and ws.ws_hash <= 930 and c.c_hash >= 106 and c.c_hash <= 856 and sm.sm_hash >= 89 and sm.sm_hash <= 489
;
