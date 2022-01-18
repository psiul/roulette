select count(ws.ws_item_sk)
from web_sales ws,warehouse w,ship_mode sm,date_dim d,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 223 and ws.ws_hash <= 973 and d.d_hash >= 277 and d.d_hash <= 677 and cd.cd_hash >= 659 and cd.cd_hash <= 992
;
