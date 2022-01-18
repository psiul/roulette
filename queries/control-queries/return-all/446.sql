select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,ship_mode sm,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 128 and ws.ws_hash <= 878 and sm.sm_hash >= 355 and sm.sm_hash <= 688 and cd.cd_hash >= 357 and cd.cd_hash <= 757
;
