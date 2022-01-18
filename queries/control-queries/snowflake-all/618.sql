select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer_demographics cd,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and d.d_hash >= 18 and d.d_hash <= 768 and cd.cd_hash >= 48 and cd.cd_hash <= 448 and sm.sm_hash >= 95 and sm.sm_hash <= 428
;
