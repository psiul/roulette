select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,ship_mode sm,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and cd.cd_hash >= 175 and cd.cd_hash <= 575 and d.d_hash >= 71 and d.d_hash <= 821 and sm.sm_hash >= 640 and sm.sm_hash <= 973
;
