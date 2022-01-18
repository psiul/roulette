select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,ship_mode sm,warehouse w
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 192 and ws.ws_hash <= 592 and cd.cd_hash >= 280 and cd.cd_hash <= 613 and sm.sm_hash >= 84 and sm.sm_hash <= 834
;
