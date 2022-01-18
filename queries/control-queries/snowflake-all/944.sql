select count(ws.ws_item_sk)
from web_sales ws,item i,customer_demographics cd,ship_mode sm,warehouse w
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and i.i_hash >= 25 and i.i_hash <= 775 and cd.cd_hash >= 209 and cd.cd_hash <= 609 and sm.sm_hash >= 16 and sm.sm_hash <= 349
;
