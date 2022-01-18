select count(ws.ws_item_sk)
from web_sales ws,warehouse w,item i,ship_mode sm,customer_demographics cd
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 224 and ws.ws_hash <= 624 and sm.sm_hash >= 191 and sm.sm_hash <= 941 and cd.cd_hash >= 433 and cd.cd_hash <= 766
;
