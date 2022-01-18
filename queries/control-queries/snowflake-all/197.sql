select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer_demographics cd,warehouse w
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and d.d_hash >= 202 and d.d_hash <= 602 and sm.sm_hash >= 173 and sm.sm_hash <= 923 and cd.cd_hash >= 206 and cd.cd_hash <= 539
;
