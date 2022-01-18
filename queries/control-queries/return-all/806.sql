select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,ship_mode sm,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 185 and ws.ws_hash <= 585 and sm.sm_hash >= 451 and sm.sm_hash <= 784 and cd.cd_hash >= 241 and cd.cd_hash <= 991
;
