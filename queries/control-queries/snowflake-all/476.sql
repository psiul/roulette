select count(ws.ws_item_sk)
from web_sales ws,warehouse w,customer_demographics cd,date_dim d,ship_mode sm
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 247 and ws.ws_hash <= 997 and cd.cd_hash >= 60 and cd.cd_hash <= 460 and sm.sm_hash >= 74 and sm.sm_hash <= 407
;
