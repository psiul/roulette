select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer c,customer_demographics cd,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 51 and ws.ws_hash <= 801 and c.c_hash >= 616 and c.c_hash <= 949 and cd.cd_hash >= 109 and cd.cd_hash <= 509
;
