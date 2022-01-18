select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,date_dim d,ship_mode sm
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 396 and cd.cd_hash <= 796 and d.d_hash >= 338 and d.d_hash <= 671 and sm.sm_hash >= 18 and sm.sm_hash <= 768
;
