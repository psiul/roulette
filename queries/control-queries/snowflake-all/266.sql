select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,date_dim d,customer_demographics cd,warehouse w
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_hash >= 241 and ws.ws_hash <= 641 and sm.sm_hash >= 180 and sm.sm_hash <= 930 and cd.cd_hash >= 577 and cd.cd_hash <= 910
;
