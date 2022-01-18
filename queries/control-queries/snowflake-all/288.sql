select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,warehouse w,ship_mode sm,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 533 and ws.ws_hash <= 866 and cd.cd_hash >= 142 and cd.cd_hash <= 892 and sm.sm_hash >= 570 and sm.sm_hash <= 970
;
