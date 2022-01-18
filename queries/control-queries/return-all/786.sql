select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,date_dim d,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 125 and sm.sm_hash <= 875 and d.d_hash >= 348 and d.d_hash <= 748 and cd.cd_hash >= 526 and cd.cd_hash <= 859
;
