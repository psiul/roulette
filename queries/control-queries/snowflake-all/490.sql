select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,ship_mode sm,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 574 and d.d_hash <= 907 and sm.sm_hash >= 496 and sm.sm_hash <= 896 and cd.cd_hash >= 204 and cd.cd_hash <= 954
;
