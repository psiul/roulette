select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,date_dim d,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 418 and ws.ws_hash <= 751 and d.d_hash >= 591 and d.d_hash <= 991 and cd.cd_hash >= 162 and cd.cd_hash <= 912
;
