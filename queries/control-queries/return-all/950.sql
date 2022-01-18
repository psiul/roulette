select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,warehouse w,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 410 and ws.ws_hash <= 743 and sm.sm_hash >= 432 and sm.sm_hash <= 832 and cd.cd_hash >= 52 and cd.cd_hash <= 802
;
