select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,customer_demographics cd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 244 and ws.ws_hash <= 577 and sm.sm_hash >= 30 and sm.sm_hash <= 780 and cd.cd_hash >= 182 and cd.cd_hash <= 582
;
