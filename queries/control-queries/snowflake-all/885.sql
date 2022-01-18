select count(ws.ws_item_sk)
from web_sales ws,item i,ship_mode sm,warehouse w,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 126 and i.i_hash <= 876 and sm.sm_hash >= 630 and sm.sm_hash <= 963 and cd.cd_hash >= 352 and cd.cd_hash <= 752
;
