select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,item i,ship_mode sm,warehouse w
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and cd.cd_hash >= 234 and cd.cd_hash <= 984 and i.i_hash >= 484 and i.i_hash <= 884 and sm.sm_hash >= 470 and sm.sm_hash <= 803
;
