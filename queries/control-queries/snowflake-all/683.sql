select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,ship_mode sm,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 161 and ws.ws_hash <= 494 and d.d_hash >= 43 and d.d_hash <= 443 and sm.sm_hash >= 236 and sm.sm_hash <= 986
;
