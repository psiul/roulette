select count(ws.ws_item_sk)
from web_sales ws,item i,warehouse w,customer_demographics cd,ship_mode sm
where ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 153 and ws.ws_hash <= 486 and i.i_hash >= 13 and i.i_hash <= 763 and sm.sm_hash >= 306 and sm.sm_hash <= 706
;
